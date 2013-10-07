require 'spec_helper'

describe RolesController do
	before(:each) do
    @role= FactoryGirl.create(:role)
  end

  describe "GET #index" do
    context "valid attributes" do 
      it "populates an array of attributes" do
        get :index
        assigns(:roles).should eq([@role])
      end
    end
  end

  describe "POST #create" do

    context "valid attributes" do
      it "creates the new object and save it into the db" do
        post(:create, role: FactoryGirl.attributes_for(:role))
        response.should be_success
        (Role.find_by name:'Manager').should_not == nil
      end
    end

    context "invalid attributes" do
      it "does not save the object into db " do
        expect{
          post(:create, role: FactoryGirl.attributes_for(:invalid_role))
        }.to_not change(Role,:count)
      end
    end
  end

  describe "GET #show" do
    context "valid attributes" do
      it "assigns the requested attribute to @role" do
        get :show, id: @role
        assigns(:role).should eq(@role)
      end
    end
  end

  describe "PUT: #update" do
    context "valid attributes" do
      it "located the requested @role" do
        put :update, id: @role, role: FactoryGirl.attributes_for(:role)
        assigns(:role).should eq(@role)
      end
      it "changes the @role's attributes" do
        put :update, id: @role, role: FactoryGirl.attributes_for(:role, name: "software developer")
        @role.reload
        @role.name.should eq("software developer")
      end 
    end
    context "invalid attributes" do
      it "should not change the @role attributes" do
        put :update, id: @role, role: FactoryGirl.attributes_for(:role, name: nil)
        @role.reload
        @role.name.should_not eq(nil)
      end
    end
  end

end
