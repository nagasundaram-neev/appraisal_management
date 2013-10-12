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
      if @role.save
        @role.kra_attrs = KraAttr.where("id in (?)" , params[:kra_attrs_id][:id])        
        flash[:notice] = "A New Role has been Successfully Created."
      else
        flash[:notice] = @role.errors.full_messages
    end
  end

  def show
    @role = Role.find(params[:id])
  end

  def update
  	  @role = Role.find(params[:id])
  	  if @role.update_attributes(role_params)
      flash[:notice] = "Role has been Successfully updated."
      @roles = Role.all
    else
    flash[:notice] = @role.errors.full_messages
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    flash[:notice] = "Successfully destroyed."
    @roles = Role.all
  end

  def add_role
    unless params[:user_id][:id].eql?("")
    user  = User.find(params[:user_id][:id])
    if user.role_users.build(:role_id => params[:role_id][:id], :appraisal_cycles_id => params[:aprsl_cycl_id][:id]).save
      flash[:notice] = "Role Successfully Assigned to User."
      @roles = Role.all
    else
      flash[:error] = "Please Select the proper Role and Appraisal Cycle."
    end
  else
    flash[:error] = "Please select the user"
    render :action => "new_role"
  end
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
   if total >100 then 
     
     flash[:notice] = "Total weightage is #{total} (it should be less than 100)"
      
   end 
  end
end
