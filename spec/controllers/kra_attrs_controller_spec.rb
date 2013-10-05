require 'spec_helper'

describe KraAttrsController do

  before(:each) do
    @kraattr = FactoryGirl.create(:kra_attr)
  end

  describe "GET #index" do
    context "valid attributes" do 
      it "populates an array of attributes" do
        get :index
        assigns(:kra_attrs).should eq([@kraattr])
      end
    end
  end

  describe "POST #create" do
    context "valid attributes" do
      it "creates the new object and save it into the db" do
        post(:create, kraattr: FactoryGirl.attributes_for(:kra_attr))
        response.should be_success
        (KraAttr.find_by name:'Drive project effectiveness').should_not == nil
      end
    end
    context "invalid attributes" do
      it "does not save the object into db " do
        expect{
          post(:create, kraattr: FactoryGirl.attributes_for(:invalid_kra_attr))
        }.to_not change(KraAttr,:count)
      end
    end
  end

  describe "GET #show" do
    context "valid attributes" do
      it "assigns the requested attribute to @kra_attr" do
        get :show, id: @kraattr
        assigns(:kra_attr).should eq(@kraattr)
      end
    end
  end

  describe "PUT: #update" do
    context "valid attributes" do
      it "located the requested @kraattr" do
        put :update, id: @kraattr, kraattr: FactoryGirl.attributes_for(:kra_attr)
        assigns(:kra_attr).should eq(@kraattr)
      end

      it "changes the @kraattr's attributes" do
        put :update, id: @kraattr, kraattr: FactoryGirl.attributes_for(:kra_attr, name: "Customer Satisfaction")
        @kraattr.reload
        @kraattr.name.should eq("Customer Satisfaction")
      end
    end
    context "invalid attributes" do
      it "should not change the @kraattr attributes" do
        put :update, id: @kraattr, kraattr: FactoryGirl.attributes_for(:kra_attr, name: "Customer Satisfaction", weightage: nil)
        @kraattr.reload
        @kraattr.weightage.should_not eq(nil)
      end
    end
  end
end
