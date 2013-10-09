class RolesController < ApplicationController
before_filter :authenticate_user!
before_filter :require_admin
before_filter :load, :only => [:new,:index, :create, :update]
before_filter :create_new_role, :only => [:new,:index]

  def load
    @roles = Role.all
  end
  
  def create_new_role
    @role = Role.new
  end
  
  def index
  end

  def edit
    @role = Role.find(params[:id])
  end

  def new
  
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
  	  params[:kra_attrs_id][:id].each do |id|
          if id != "" then
            @role.save_kr_role_attr(id)
          end
        end
    if @role.update_attributes(role_params)
      flash[:notice] = "Successfully updated."
      @roles = Role.all
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    flash[:notice] = "Successfully destroyed."
    @roles = role.all
  end

  def add_role
    user  = User.find(params[:user_id][:id])
    user.role_users.build(:role_id => params[:role_id][:id], :appraisal_cycles_id => params[:aprsl_cycl_id][:id]).save
  end

  def new_role
  @role = Role.new
  end


  def role_params
    params.require(:role).permit(:name, :kra_attrs_id)
  end
end
