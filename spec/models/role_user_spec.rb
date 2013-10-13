require 'spec_helper'

describe RoleUser do

	before (:each) do
	  @role_user = FactoryGirl.create(:role_user)
	end

  it { should belong_to(:user) }
  it { should belong_to(:role) }

  it "user id should be present" do
    @role_user2 = RoleUser.new(:user_id =>nil , :role_id => 3 , :appraisal_cycles_id=>4)
    @role_user2.should_not be_valid
  end

  it "role id should be present" do
    @role_user2 = RoleUser.new(:user_id =>2 , :role_id => nil , :appraisal_cycles_id=>4)
    @role_user2.should_not be_valid
  end

  it "appraisal cycle  id should be present" do
    @role_user2 = RoleUser.new(:user_id =>4 , :role_id => 3 , :appraisal_cycles_id=>nil)
    @role_user2.should_not be_valid
  end

end
