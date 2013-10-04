require 'spec_helper'

describe Department do
  before(:each) do
    @dept = FactoryGirl.create(:department)
  end
  it "should not be valid if dept name is missing" do
    @dept.name = ""
    @dept.should_not be_valid
  end
  it "should not have two departments with the same name" do
    @dept2 = Department.new(:name => "BU3")
    @dept2.should_not be_valid
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
