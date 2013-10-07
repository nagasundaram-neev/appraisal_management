class RolesController < ApplicationController
	def index
    @roles = Role.all
  end

  def edit
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save
        params[:kra_attrs_id][:id].each do |id|
          if id != "" then
            @role.save_kr_role_attr(id)
          end
        end
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
    params.require(:role).permit(:name, :kra_attrs_id)
  end
end
