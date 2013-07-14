require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.default_cassette_options = { :record => :new_episodes }
  c.hook_into :webmock
  c.filter_sensitive_data('<API_KEY>') { ENV['JAMBASE_API_KEY'] }
  c.configure_rspec_metadata!
end
