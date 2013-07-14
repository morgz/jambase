require 'spec_helper'

describe Jambase::Artist, vcr: true do
  let(:subject){ api.artist_by_id(6763) }
  its(:name){ should eq('They Might Be Giants') }
end

