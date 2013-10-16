require 'spec_helper'

describe KraRatingsController do

include Devise::TestHelpers

before (:each) do
  @admin = FactoryGirl.create(:admin)
  sign_in @admin
  @kra_rating = FactoryGirl.create(:kra_rating)
end

describe "GET #revert_signoff" do
  it "should change the appraisee_status of the kra_sheet which id is sent by user" do
    get :revert_signoff, {:kra_sheet_id => '12'}
    KraSheet.find(12).appraisee_status.should eq(0)
  end
end

end
