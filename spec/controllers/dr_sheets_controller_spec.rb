require 'spec_helper'

describe DrSheetsController do

	include Devise::TestHelpers


	before (:each) do
	  @admin = FactoryGirl.create(:admin)
	  sign_in @admin
	  @dr_sheet = FactoryGirl.create(:dr_sheet)
	end

	 describe "GET #index" do
    context "valid dr sheet" do 
      it "populates an array of dr sheets" do
        xhr :get, :index
        response.status.should be == 200
        response.should render_template('dr_sheets/index')
        assigns(:dr_sheets).should eq([@dr_sheet])
      end
    end
  end

  describe "POST #create" do
    context "valid dr sheets" do
      it "creates the new object and save it into the db" do
        post(:create, dr_sheet: FactoryGirl.attributes_for(:dr_sheet))
        response.should be_success
        (DrSheet.find_by appraisal_cycle_id:1).should_not == nil
      end
    end
  end

  describe "PUT: #update" do
    context "valid dr sheet" do
      it "located the requested @dr_sheet" do
        put :update, id: @dr_sheet, dr_sheet: FactoryGirl.attributes_for(:dr_sheet)
        assigns(:dr_sheet).should eq(@dr_sheet)
      end
      it "changes the @dr_sheet's attributes" do
        put :update, id: @dr_sheet, dr_sheet: FactoryGirl.attributes_for(:dr_sheet, appraisal_cycle_id: 2)
        @dr_sheet.reload
        @dr_sheet.appraisal_cycle_id.should eq(2)
      end 
    end
  end

  describe "GET #show" do
    context "valid dr_sheets" do
      it "assigns the requested depatement to @dr_sheet" do
        get :show, id: @dr_sheet
        assigns(:dr_sheet).should eq(@dr_sheet)
      end
    end
  end


end
