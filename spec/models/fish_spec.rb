require File.dirname(__FILE__) + '/../spec_helper'

describe Fish do
  it "should be valid" do
    Fish.new.should be_valid
  end
end
