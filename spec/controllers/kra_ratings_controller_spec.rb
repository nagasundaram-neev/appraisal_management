require 'spec_helper'

describe KraRatingsController do

include Devise::TestHelpers

before (:each) do
  @appraiser = FactoryGirl.create(:appraiser)
  sign_in @appraiser
  @kra_rating = FactoryGirl.create(:kra_rating)
  @kra_sheet = FactoryGirl.create(:kra_sheet)
end

describe "GET #revert_signoff" do
  it "should change the appraisee_status of the kra_sheet which id is sent by user" do
    xhr :get, :revert_signoff, {:kra_sheet_id => @kra_sheet.id}
    KraSheet.find(@kra_sheet.id).appraisee_status.should eq(false)
  end
end

end
