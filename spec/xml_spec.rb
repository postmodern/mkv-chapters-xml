require 'spec_helper'
require 'mkv/chapters/xml'

describe MKV::Chapters::XML do
  it "should have a VERSION constant" do
    expect(described_class.const_get('VERSION')).to_not be_empty
  end
end
