require 'spec_helper'

describe KraAttr do
  
  before(:each) do
    @kraattr = FactoryGirl.create(:kra_attr)
  end

  it { should have_many(:kra_role_attrs) }

  it "should not be valid if name is missing" do
    @kraattr.name = ""
    @kraattr.should_not be_valid
  end

  it "should not be valid if weightage is missing" do
    @kraattr.weightage = ""
    @kraattr.should_not be_valid
  end

  it "should not be valid if desc is  missing" do
    @kraattr.desc = ""
    @kraattr.should_not be_valid
  end

  it "should not be valid if weightage is not in 1-99" do
    @kraattr.weightage = 100
    @kraattr.should_not be_valid
  end
end
