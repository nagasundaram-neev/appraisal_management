class DepartmentsController < ApplicationController

  def new
    @dept = Department.new
  end

  def index
    @depts = Department.all
  end

  def create
    @dept = Department.new(department_params)
    respond_to do |format|
      if @dept.save
        format.html
        
      else
        format.html
      end
    
    end
  end

  def show
    @dept = Department.find(params[:id])
  end

  def update
    @dept = Department.find(params[:id])
    @dept.update_attributes(department_params)
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
