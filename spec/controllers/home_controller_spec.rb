require 'spec_helper'

describe HomeController do

  before (:each) do
    @appraiser = FactoryGirl.create(:appraiser)
    sign_in @appraiser
  end

  describe "#get_appraisees" do
    it "should set @appraises with an array of all kra sheets having appraiser_status =0 or appraise_status =0 for admin " do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
      @kra_sheet1 = FactoryGirl.create(:kra_sheet1, :appraisee_id => 90, :appraiser_id => 91, :appraisal_cycle_id => 92)
      @kra_sheet2 = FactoryGirl.create(:kra_sheet2,:appraisee_id => 95, :appraiser_id => 94, :appraisal_cycle_id => 93)
      @kra_sheet3 = FactoryGirl.create(:kra_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => 87, :appraisal_cycle_id => 98)
      xhr :get, :get_appraisees
      assigns(:appraisees).should =~([@kra_sheet2,@kra_sheet1])
    end
    it "should set the @appraises with kra sheets array having appraiser_status = 0 and appraiser_id as the current user id"  do
      @kra_sheet2 = FactoryGirl.create(:kra_sheet2, :appraiser_id => @appraiser.id)
      xhr :get, :get_appraisees
        assigns(:appraisees).should =~([@kra_sheet2])
    end
    it "should set @appraisees as nil if there is NoMethodError(no kra sheets available)" do
      @kra_sheet1 = FactoryGirl.create(:kra_sheet1, :appraisee_id => 90, :appraiser_id => 91, :appraisal_cycle_id => 92)
      @kra_sheet2 = FactoryGirl.create(:kra_sheet2,:appraisee_id => 95, :appraiser_id => 94, :appraisal_cycle_id => 93)
      @kra_sheet3 = FactoryGirl.create(:kra_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => 87, :appraisal_cycle_id => 98)
      @kra_sheet4 = FactoryGirl.create(:kra_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => 86, :appraisal_cycle_id => 101)
      @kra_sheet5 = FactoryGirl.create(:kra_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => 87, :appraisal_cycle_id => 102)
      xhr :get, :get_appraisees
      assigns(:appraisees).should =~([])
    end
  end

  describe "#get_past_appraisees" do
    it "should set @kra_sheets with an array of all kra sheets having appraiser_status =1 for admin " do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
      @kra_sheet1 = FactoryGirl.create(:kra_sheet1, :appraisee_id => 90, :appraiser_id => 91, :appraisal_cycle_id => 92)
      @kra_sheet2 = FactoryGirl.create(:kra_sheet2,:appraisee_id => 95, :appraiser_id => 94, :appraisal_cycle_id => 93)
      @kra_sheet3 = FactoryGirl.create(:kra_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => 87, :appraisal_cycle_id => 98)
      @kra_sheet4 = FactoryGirl.create(:kra_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => 86, :appraisal_cycle_id => 101)
      @kra_sheet5 = FactoryGirl.create(:kra_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => 87, :appraisal_cycle_id => 102)
      xhr :get, :get_past_appraisees
      assigns(:kra_sheets).should =~([@kra_sheet3,@kra_sheet4,@kra_sheet5])
    end
    it "should set @kra_sheets with an array of kra sheets where appraiser_status =0 and appraiser_id as the current user id" do
      @kra_sheet1 = FactoryGirl.create(:kra_sheet1, :appraisee_id => 90, :appraiser_id => 91, :appraisal_cycle_id => 92)
      @kra_sheet2 = FactoryGirl.create(:kra_sheet2,:appraisee_id => 95,:appraiser_status => 1, :appraiser_id => 94, :appraisal_cycle_id => 93)
      @kra_sheet3 = FactoryGirl.create(:kra_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => @appraiser.id, :appraisal_cycle_id => 98)
      @kra_sheet4 = FactoryGirl.create(:kra_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => @appraiser.id, :appraisal_cycle_id => 101)
      @kra_sheet5 = FactoryGirl.create(:kra_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => @appraiser.id, :appraisal_cycle_id => 102)
      xhr :get, :get_past_appraisees
      assigns(:kra_sheets).should =~([@kra_sheet3,@kra_sheet4,@kra_sheet5])
    end
  end

  describe "#get_past_dr_appraisees" do
    it "should set @dr_sheets with an array of all dr sheets having appraiser_status =1 for admin " do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
      @dr_sheet1 = FactoryGirl.create(:dr_sheet1, :appraisee_id => 90, :appraiser_id => 91, :appraisal_cycle_id => 92)
      @dr_sheet2 = FactoryGirl.create(:dr_sheet2,:appraisee_id => 95, :appraiser_id => 94, :appraisal_cycle_id => 93)
      @dr_sheet3 = FactoryGirl.create(:dr_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => 87, :appraisal_cycle_id => 98)
      @dr_sheet4 = FactoryGirl.create(:dr_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => 86, :appraisal_cycle_id => 101)
      @dr_sheet5 = FactoryGirl.create(:dr_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => 87, :appraisal_cycle_id => 102)
      xhr :get, :get_past_dr_appraisees
      assigns(:dr_sheets).should =~([@dr_sheet3,@dr_sheet4,@dr_sheet5])
    end
    it "should set @dr_sheets with an array of dr sheets where appraiser_status =0 and appraiser_id as the current user id" do
      @dr_sheet1 = FactoryGirl.create(:dr_sheet1, :appraisee_id => 90, :appraiser_id => 91, :appraisal_cycle_id => 92)
      @dr_sheet2 = FactoryGirl.create(:dr_sheet2,:appraisee_id => 95,:appraiser_status => 1, :appraiser_id => 94, :appraisal_cycle_id => 93)
      @dr_sheet3 = FactoryGirl.create(:dr_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => @appraiser.id, :appraisal_cycle_id => 98)
      @dr_sheet4 = FactoryGirl.create(:dr_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => @appraiser.id, :appraisal_cycle_id => 101)
      @dr_sheet5 = FactoryGirl.create(:dr_sheet2,:appraisee_status => 1, :appraiser_status => 1,:appraisee_id => 90, :appraiser_id => @appraiser.id, :appraisal_cycle_id => 102)
      xhr :get, :get_past_dr_appraisees
      assigns(:dr_sheets).should =~([@dr_sheet3,@dr_sheet4,@dr_sheet5])
    end
  end

  describe "#get_dr_appraisees" do
    it "should set @appraises with all the dr sheets arrau having appraiser_status =0 or appraise_status =0 for admin " do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
      @dr_sheet1 = FactoryGirl.create(:dr_sheet1)
      @dr_sheet2 = FactoryGirl.create(:dr_sheet2)
      @dr_sheet3 = FactoryGirl.create(:dr_sheet2,:appraisee_status => 1, :appraiser_status => 1)
      xhr :get, :get_dr_appraisees
      assigns(:appraisees).should =~([@dr_sheet2,@dr_sheet1])
    end
    it "should set the @appraises with dr sheets array having appraiser_status = 0 and appraiser_id as current user id" do
      @dr_sheet2 = FactoryGirl.create(:dr_sheet2, :appraiser_id => @appraiser.id)
      xhr :get, :get_dr_appraisees
        assigns(:appraisees).should =~([@dr_sheet2])
    end
  end
end
