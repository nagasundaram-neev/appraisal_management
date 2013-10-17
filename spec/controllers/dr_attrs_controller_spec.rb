require 'spec_helper'

describe DrAttrsController do

	include Devise::TestHelpers


  before (:each) do
    @admin = FactoryGirl.create(:admin)
    sign_in @admin
    @dr_attr = FactoryGirl.create(:dr_attr)
  end

  describe "GET #index" do
    context "valid attributes" do 
      it "populates an array of attributes" do
        get :index
        assigns(:dr_attrs).should eq([@dr_attr])
      end
    end
  end

  describe "POST #create" do
    context "valid attributes" do
      it "creates the new object and save it into the db" do
        post(:create, dr_attr: FactoryGirl.attributes_for(:dr_attr))
        response.should be_success
        (DrAttr.find_by name:'Initiative').should_not == nil
      end
    end
    context "invalid attributes" do
      it "does not save the object into db " do
        expect{
          post(:create, dr_attr: FactoryGirl.attributes_for(:invalid_dr_attr))
        }.to_not change(DrAttr,:count)
      end
    end
  end

  describe "GET #show" do
    context "valid attributes" do
      it "assigns the requested attribute to @dr_attr" do
        get :show, id: @dr_attr
        assigns(:dr_attr).should eq(@dr_attr)
      end
    end
  end

  describe "PUT: #update" do
    context "valid attributes" do
      it "located the requested @dr_attr" do
        put :update, id: @dr_attr, dr_attr: FactoryGirl.attributes_for(:dr_attr)
        assigns(:dr_attr).should eq(@dr_attr)
      end

      it "changes the @dr_attr's attributes" do
        put :update, id: @dr_attr, dr_attr: FactoryGirl.attributes_for(:dr_attr, name: "Customer Satisfaction")
        @dr_attr.reload
        @dr_attr.name.should eq("Customer Satisfaction")
      end
    end
    context "invalid attributes" do
      it "should not change the @dr_attr attributes" do
        put :update, id: @dr_attr, dr_attr: FactoryGirl.attributes_for(:dr_attr, name: "Customer Satisfaction", weightage: nil)
        @dr_attr.reload
        @dr_attr.weightage.should_not eq(nil)
      end
    end
  end

end
