require_relative '../lib/jambase'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.default_cassette_options = { :record => :new_episodes }
  c.hook_into :webmock
  c.filter_sensitive_data('<API_KEY>') { ENV.fetch 'JAMBASE_API_KEY' }
  c.configure_rspec_metadata!
end

def api
  Jambase::Api.new(ENV.fetch 'JAMBASE_API_KEY')
end
