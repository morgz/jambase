require 'spec_helper.rb'
require_relative '../lib/jambase'

describe Jambase do

  describe Jambase::Connection, vcr: true do

    let(:conn){ Jambase::Connection.new(ENV['JAMBASE_API_KEY']) }
    let(:bad_conn){ Jambase::Connection.new('fake_api_key') }

    it 'connects' do
      response = conn.get('events', id: 0)
      response['Id'].should eq(0)
    end

    describe '#authenticated?' do
      it 'returns true when credentials are valid' do
        conn.authenticated?.should be_true
      end
      it 'returns false when credentials are valid' do
        bad_conn.authenticated?.should be_false
      end
    end

  end
end
