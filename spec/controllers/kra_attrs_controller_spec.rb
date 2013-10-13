require 'spec_helper'

describe KraAttrsController do

  include Devise::TestHelpers


  before (:each) do
    @admin = FactoryGirl.create(:admin)
    sign_in @admin
    @kra_attr = FactoryGirl.create(:kra_attr)
  end

  describe "GET #index" do
    context "valid attributes" do 
      it "populates an array of attributes" do
        get :index
        assigns(:kra_attrs).should eq([@kra_attr])
      end
    end
  end

  describe "POST #create" do
    context "valid attributes" do
      it "creates the new object and save it into the db" do
        post(:create, kra_attr: FactoryGirl.attributes_for(:kra_attr))
        response.should be_success
        (KraAttr.find_by name:'Drive project effectiveness').should_not == nil
      end
    end
    context "invalid attributes" do
      it "does not save the object into db " do
        expect{
          post(:create, kra_attr: FactoryGirl.attributes_for(:invalid_kra_attr))
        }.to_not change(KraAttr,:count)
      end
    end
  end

  describe "GET #show" do
    context "valid attributes" do
      it "assigns the requested attribute to @kra_attr" do
        get :show, id: @kra_attr
        assigns(:kra_attr).should eq(@kra_attr)
      end
    end
  end

  describe "PUT: #update" do
    context "valid attributes" do
      it "located the requested @kra_attr" do
        put :update, id: @kra_attr, kra_attr: FactoryGirl.attributes_for(:kra_attr)
        assigns(:kra_attr).should eq(@kra_attr)
      end

      it "changes the @kra_attr's attributes" do
        put :update, id: @kra_attr, kra_attr: FactoryGirl.attributes_for(:kra_attr, name: "Customer Satisfaction")
        @kra_attr.reload
        @kra_attr.name.should eq("Customer Satisfaction")
      end
    end
    context "invalid attributes" do
      it "should not change the @kra_attr attributes" do
        put :update, id: @kra_attr, kra_attr: FactoryGirl.attributes_for(:kra_attr, name: "Customer Satisfaction", weightage: nil)
        @kra_attr.reload
        @kra_attr.weightage.should_not eq(nil)
      end
    end
  end
end
