require 'spec_helper'

describe DepartmentsController do

  include Devise::TestHelpers


  before (:each) do
    @admin = FactoryGirl.create(:admin)
    sign_in @admin
    @department = FactoryGirl.create(:department)
  end

  describe "GET #index" do
    context "valid attributes" do 
      it "populates an array of attributes" do
        xhr :get, :index
        response.status.should be == 200
        response.should render_template('departments/index')
        assigns(:departments).should eq([@department])
      end
    end
  end

  describe "POST #create" do
    context "valid Departments" do
      it "creates the new object and save it into the db" do
        post(:create, department: FactoryGirl.attributes_for(:department))
        response.should be_success
        (Department.find_by name:'BU3').should_not == nil
      end
    end

    context "invalid depatment" do
      it "does not save the object into db " do
        expect{
          post(:create, department: FactoryGirl.attributes_for(:invalid_department))
        }.to_not change(Department,:count)
      end
    end
  end

  describe "PUT: #update" do
    context "valid department" do
      it "located the requested @department" do
        put :update, id: @department, department: FactoryGirl.attributes_for(:department)
        assigns(:department).should eq(@department)
      end
      it "changes the @department's attributes" do
        put :update, id: @department, department: FactoryGirl.attributes_for(:department, name: "BU2")
        @department.reload
        @department.name.should eq("BU2")
      end 
    end
    context "invalid attributes" do
      it "should not change the @department attributes" do
        put :update, id: @department, department: FactoryGirl.attributes_for(:department, name: nil)
        @department.reload
        @department.name.should_not eq(nil)
      end
    end
  end

  describe "GET #show" do
    context "valid departments" do
      it "assigns the requested depatement to @department" do
        get :show, id: @department
        assigns(:department).should eq(@department)
      end
    end
  end

  describe "POST: #add_dept" do
    it "should add the new department for the user whose id comes in request params " do
      @user = FactoryGirl.create(:user)
      xhr :post, :add_dept, {:user_id => {:id => @user.id}, :dept_id => {:id => @department.id}, :start_date => '21-11-2013' }
      @user.department_users.where(:department_id => @department.id, :start_date => '2013-11-21').first.department.should  eq(@department)
    end
    it "should ser the end_date value as start_date value in params " do
      @user = FactoryGirl.create(:user)
      xhr :post, :add_dept, {:user_id => {:id => @user.id}, :dept_id => {:id => @department.id}, :start_date => '21-11-2013' }
      @user.department_users.where(:department_id => @department.id, :start_date => '2013-11-21').first.end_date.to_s.should  eq('2013-11-21')
    end
  end

end
