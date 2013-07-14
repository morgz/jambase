require 'httparty'
require 'active_support/core_ext/hash'

module Jambase
  class Connection
    include HTTParty
    base_uri 'api.jambase.com'

    def initialize(api_key)
      @api_key = api_key
    end

    def get(endpoint, params={})
      get_unchecked(endpoint, params).tap do
        raise NotAuthenticated unless authenticated?
      end
    end

    def get_unchecked(endpoint, params={})
      url = "/#{endpoint}?#{params.merge(default_params).to_query}"
      puts url
      @last_response = self.class.get(url)
    end

    def authenticated?
      last_response.code != 403
    end

    def default_params
      {:api_key => @api_key}
    end

    def last_response
      @last_response || get_unchecked('events',id:0)
    end

  end
  class NotAuthenticated < StandardError; end
end
