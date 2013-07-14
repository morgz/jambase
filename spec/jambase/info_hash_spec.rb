require 'spec_helper'
describe Jambase::InfoHash do

  let(:info){ described_class.new('SomeThing'=>1, 'Present'=>1) }

  it 'translates attributes' do
    info.some_thing.should eq(1)
  end

  context '#respond_to' do
    it 'it true for present attributes' do
      info.should respond_to :present
    end
    it 'is false for absent items' do
      info.should_not respond_to :not_present
    end
  end

end
