class DepartmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin

  before_filter :load, :only => [:new,:index, :create, :update]
  before_filter :create_new_department, :only => [:new,:index]

  def load
    @departments = Department.all
  end

  def create_new_department
    @department = Department.new
  end

  def new
    flash[:notice] = nil
  end

  def index
  end

  def create
    @department = Department.new(department_params)
      if @department.save
        @departments = Department.all
        flash[:notice] = "A New Department has been Successfully Created."
      else
        flash[:notice] = @department.errors.full_messages
      end
  end

  def edit
  @department = Department.find(params[:id])
  end

  def show
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(department_params)
      flash[:notice] = "Department has been Successfully Updated."
      @departments = Department.all
    else
      flash[:notice] = @department.errors.full_messages
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    flash[:notice] = "Department Successfully destroyed."
    @departments = Department.all
  end

  def add_dept
    unless params[:user_id][:id].eql?("")
      user = User.find(params[:user_id][:id])
      p user.id
      p "dept id in params is"
      p params[:dept_id][:id]
      p params[:start_date]
      if user.department_users.build(:department_id => params[:dept_id][:id], :start_date => params[:start_date] ).save
        p "department of user added"
        dept_user = user.department_users.where(:end_date => nil).first
        dept_user.update_attributes(:end_date => params[:start_date])
        flash[:notice]="New Department successfull added"
        @departments = Department.all
      else
        p "failed cant add dept user"
        flash[:error] = "Please select the Department for user."
      end
    else
      flash[:error] = "Please select the user"
      render :action => "new_dept"
    end
  end

  def new_dept
    flash[:notice] = nil
    @dept = Department.new
  end

  def department_params
    params.require(:department).permit(:name)
  end
end
