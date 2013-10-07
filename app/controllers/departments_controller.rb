class DepartmentsController < ApplicationController
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
  
  def department_params
    params.require(:dept).permit(:name)
  end
end
