require 'spec_helper'

describe Jambase::Artist, vcr: true do
  let(:subject){ api.artist_by_id(6763) }
  its(:name){ should eq('They Might Be Giants') }

  context 'event list' do
    it 'should exist' do
      subject.events.should be_an Array
    end
    it 'should contain Events' do
      subject.events.first.should be_a Jambase::Event
    end
    it 'should refer to the artist' do
      subject.events.first.artists.should include(subject)
    end
  end

end
