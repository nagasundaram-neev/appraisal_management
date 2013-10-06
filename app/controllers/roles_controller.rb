class RolesController < ApplicationController
	def index
    @roles = Role.all
  end

  def create
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save
        format.html
        format.js
      else
        format.html
      end
    end
  end

  def show
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    @role.update_attributes(role_params)
  end
  
  def role_params
    params.require(:role).permit(:name)
  end
end
