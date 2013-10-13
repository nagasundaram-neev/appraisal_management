require 'spec_helper'

describe KraSheetsController do

	include Devise::TestHelpers


	before (:each) do
	  @admin = FactoryGirl.create(:admin)
	  sign_in @admin
	  @kra_sheet = FactoryGirl.create(:kra_sheet)
	end

	 describe "GET #index" do
    context "valid kra sheet" do 
      it "populates an array of kra sheets" do
        xhr :get, :index
        response.status.should be == 200
        response.should render_template('kra_sheets/index')
        assigns(:kra_sheets).should eq([@kra_sheet])
      end
    end
  end

  describe "POST #create" do
    context "valid kra sheets" do
      it "creates the new object and save it into the db" do
        post(:create, kra_sheet: FactoryGirl.attributes_for(:kra_sheet))
        response.should be_success
        (KraSheet.find_by appraisal_cycle_id:1).should_not == nil
      end
    end
  end

  describe "PUT: #update" do
    context "valid kra sheet" do
      it "located the requested @kra_sheet" do
        put :update, id: @kra_sheet, kra_sheet: FactoryGirl.attributes_for(:kra_sheet)
        assigns(:kra_sheet).should eq(@kra_sheet)
      end
      it "changes the @kra_sheet's attributes" do
        put :update, id: @kra_sheet, kra_sheet: FactoryGirl.attributes_for(:kra_sheet, appraisal_cycle_id: 2)
        @kra_sheet.reload
        @kra_sheet.appraisal_cycle_id.should eq(2)
      end 
    end
  end

  describe "GET #show" do
    context "valid kra_sheets" do
      it "assigns the requested depatement to @kra_sheet" do
        get :show, id: @kra_sheet
        assigns(:kra_sheet).should eq(@kra_sheet)
      end
    end
  end


end
