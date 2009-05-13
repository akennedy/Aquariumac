require File.dirname(__FILE__) + '/../spec_helper'

describe Aquarium do
  it "should be valid" do
    Aquarium.new.should be_valid
  end
end
