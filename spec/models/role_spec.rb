require 'spec_helper'

describe Role do
  before(:each) do
    @role = FactoryGirl.create(:role)
  end
  it { should have_many(:users).through(:role_users) }
  it { should have_many(:role_users) }
  
  it { should have_many(:department_roles) }
  it { should have_many(:departments).through(:department_roles) }

  it "should not be valid if role name is missing" do
    @role.name = ""
    @role.should_not be_valid
  end

  it "should have many department_roles" do
    g = Role.reflect_on_association(:department_roles)
    g.macro.should == :has_many
  end

end
