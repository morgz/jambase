require 'spec_helper'

describe Jambase::Event, vcr: true do
  let(:subject){ api.events_by_zip(78701).first }
  its(:venue){ should be_a Jambase::Venue }
  its(:artists){ should be_a Array }
end
