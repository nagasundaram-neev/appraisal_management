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
  end


  def index
  end

  def create
    @department = Department.new(department_params)
      if @department.save
        @departments = Department.all
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
    @department.update_attributes(department_params)
  end
  def destroy
    @department = Department.find { params[:id]  }
    @department.destroy
    flash[:notice] = "Successfully destroyed."
    @departments = Department.all
    #format.html
  end
  def add_dept
    Department.new.save_dept_user(params[:user_id],params[:dept_id][:id])
  end
  def new_dept
  @dept = Department.new
  end 
  
  def department_params
    params.require(:department).permit(:name)
  end
end
