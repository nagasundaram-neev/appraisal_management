require 'spec_helper'

describe DepartmentsController do

	before(:each) do
    @dept= FactoryGirl.create(:department)
  end

  describe "GET #index" do
    context "valid attributes" do 
      it "populates an array of attributes" do
        get :index
        assigns(:depts).should eq([@dept])
      end
    end
  end

  describe "POST #create" do

    context "valid attributes" do
      it "creates the new object and save it into the db" do
        post(:create, dept: FactoryGirl.attributes_for(:department))
        response.should be_success
        (Department.find_by name:'BU3').should_not == nil
      end
    end

    context "invalid attributes" do
      it "does not save the object into db " do
        expect{
          post(:create, dept: FactoryGirl.attributes_for(:invalid_department))
        }.to_not change(Department,:count)
      end
    end
  end

  describe "GET #show" do
    context "valid attributes" do
      it "assigns the requested attribute to @dept" do
        get :show, id: @dept
        assigns(:dept).should eq(@dept)
      end
    end
  end

  describe "PUT: #update" do
    context "valid attributes" do
      it "located the requested @dept" do
        put :update, id: @dept, dept: FactoryGirl.attributes_for(:department)
        assigns(:dept).should eq(@dept)
      end
      it "changes the @dept's attributes" do
        put :update, id: @dept, dept: FactoryGirl.attributes_for(:department, name: "BU5")
        @dept.reload
        @dept.name.should eq("BU5")
      end 
    end
    context "invalid attributes" do
      it "should not change the @dept attributes" do
        put :update, id: @dept, dept: FactoryGirl.attributes_for(:department, name: nil)
        @dept.reload
        @dept.name.should_not eq(nil)
      end
    end
  end

end
