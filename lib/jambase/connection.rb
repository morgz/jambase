require 'httparty'
require 'active_support/core_ext/hash'

module Jambase
  class Connection
    include HTTParty
    base_uri 'api.jambase.com'

    def initialize(api_key)
      raise NilApiKey if api_key.nil?
      @api_key = api_key
    end

    def get(endpoint, params={})
      get_unchecked(endpoint, params).tap do
        check_response
      end
    end

    def get_unchecked(endpoint, params={})
      url = "/#{endpoint}?#{params.merge(default_params).to_query}"
      @last_response = self.class.get(url)
    end

    def check_response
      raise RateLimited if rate_limited?
      raise NotAuthenticated unless authenticated?
    end

    def authenticated?
      last_response.code != 403
    end

    def rate_limited?
      last_response['h1'] == '403 Developer Over Rate'
    end

    def default_params
      {:api_key => @api_key}
    end

    def last_response
      @last_response || get_unchecked('events',id:0)
    end

  end
  class NotAuthenticated < StandardError; end
  class NilApiKey < ArgumentError; end
  class RateLimited < StandardError; end
end
