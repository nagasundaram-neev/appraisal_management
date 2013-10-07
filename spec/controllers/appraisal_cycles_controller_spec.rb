require 'spec_helper'

describe AppraisalCyclesController do
 before(:each) do
    @appraisal_cycle= FactoryGirl.create(:appraisal_cycle)
  end

  describe "GET #index" do
    context "valid attributes" do 
      it "populates an array of attributes" do
        get :index
        assigns(:appraisal_cycles).should eq([@appraisal_cycle])
      end
    end
  end

  describe "POST #create" do

    context "valid attributes" do
      it "creates the new object and save it into the db" do
        post(:create, appraisal_cycle: FactoryGirl.attributes_for(:appraisal_cycle))
        response.should be_success
        (AppraisalCycle.find_by start_date:'2013-03-01').should_not == nil
      end
    end

    context "invalid attributes" do
      it "does not save the object into db " do
        expect{
          post(:create, appraisal_cycle: FactoryGirl.attributes_for(:invalid_appraisal_cycle))
        }.to_not change(AppraisalCycle,:count)
      end
    end
  end

  describe "GET #show" do
    context "valid attributes" do
      it "assigns the requested attribute to @appraisal_cycle" do
        get :show, id: @appraisal_cycle
        assigns(:appraisal_cycle).should eq(@appraisal_cycle)
      end
    end
  end

  describe "PUT: #update" do
    context "valid attributes" do
      it "located the requested @appraisal_cycle" do
        put :update, id: @appraisal_cycle, appraisal_cycle: FactoryGirl.attributes_for(:appraisal_cycle)
        assigns(:appraisal_cycle).should eq(@appraisal_cycle)
      end
      it "changes the @appraisal_cycle's attributes" do
        put :update, id: @appraisal_cycle, appraisal_cycle: FactoryGirl.attributes_for(:appraisal_cycle, start_date: "2013-03-01")
        @appraisal_cycle.reload
        @appraisal_cycle.start_date.should eq("2013-03-01".to_date)
      end 
    end
    context "invalid attributes" do
      it "should not change the @appraisal_cycle attributes" do
        put :update, id: @appraisal_cycle, appraisal_cycle: FactoryGirl.attributes_for(:appraisal_cycle, start_date: nil)
        @appraisal_cycle.reload
        @appraisal_cycle.start_date.should_not eq(nil)
      end
    end
  end

end
