require 'spec_helper'

describe Jambase::Venue, vcr: true do
  let(:paramount){ 652 }
  let(:subject){ api.venue_by_id(paramount) }

  its(:name){ should eq 'Paramount Theatre' }
  its(:city){ should eq 'Austin' }

  it 'should have a list of events' do
    subject.events.first.should be_a Jambase::Event
  end

end
