require 'spec_helper'

describe RolesController do
	
  include Devise::TestHelpers

  before (:each) do
    @admin = FactoryGirl.create(:admin)
    sign_in @admin
    @role= FactoryGirl.create(:role)
  end

  describe "GET #index" do
    context "valid role" do 
      it "populates an array of roles" do
        xhr :get, :index
        response.status.should be == 200
        response.should render_template('roles/index')
        assigns(:roles).should eq([@role])
      end
    end
  end

  describe "GET #show" do
    context "valid role" do
      it "assigns the requested attribute to @role" do
        get :show, id: @role
        assigns(:role).should eq(@role)
      end
    end
  end
end
