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

  it { should have_many(:roles).through(:department_roles) }
  it { should have_many(:department_roles) }

  it { should have_many(:users).through(:department_users) }
  it { should have_many(:department_users) }
end
