require 'spec_helper'
require 'mkv/chapters/xml'

describe Mkv::Chapters::XML do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end
end
