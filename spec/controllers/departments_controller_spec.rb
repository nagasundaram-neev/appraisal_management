require 'spec_helper'

describe DepartmentsController do

  include Devise::TestHelpers


  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @dept = FactoryGirl.create(:department)
  end

  describe "GET #index" do
    context "valid attributes" do 
      it "populates an array of attributes" d0
        get :index
        assigns(:depts).should eq([@dept])
      end
    end
  end

end
