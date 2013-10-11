class RolesController < ApplicationController
before_filter :authenticate_user!
before_filter :require_admin
before_filter :load, :only => [:new,:index, :create, :update]
before_filter :create_new_role, :only => [:new,:index]
before_action :check_selected_attributes, :only =>[:create, :update] 

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
         @role.kra_attrs = KraAttr.where("id in (?)" , params[:kra_attrs_id][:id])
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
    if @role.update_attributes(role_params)
       @role.kra_attrs = KraAttr.where("id in (?)" , params[:kra_attrs_id][:id])
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

  def check_selected_attributes
    total = 0
    params[:kra_attrs_id][:id].each do |id|
      if id != "" then
        total += KraAttr.find(id).weightage
        p total
      end
    end
   if total >100 || total < 100 then    
    raise "total weightage is #{total}"
   end 
  end
end
