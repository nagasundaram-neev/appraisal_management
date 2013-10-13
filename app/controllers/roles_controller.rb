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
      unless check_selected_attributes()==false
      @weightage_err=0
      if @role.save
        @role.kra_attrs = KraAttr.where("id in (?)" , params[:kra_attrs_id][:id])        
        flash[:notice] = "A New Role has been Successfully Created."
      else
        flash[:notice] = @role.errors.full_messages
    end
    else
      @weightage_err=1
      flash[:notice] = "Weightage should be less than or equal 100"
    end
  end

  def show
    @role = Role.find(params[:id])
  end

  def update
  	  @role = Role.find(params[:id])
      unless check_selected_attributes()==false
        @weightage_err=0
        if @role.update_attributes(role_params)
          @role.kra_attrs = KraAttr.where("id in (?)" , params[:kra_attrs_id][:id])        
          flash[:notice] = "Role has been Successfully updated."
          @roles = Role.all

        else
          
          flash[:notice] = @role.errors.full_messages
        end
      else
        @weightage_err=1
        flash[:notice] = "Weightage should be less than or equal 100"
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
      if !user.role_users.where(:appraisal_cycles_id => params[:aprsl_cycl_id][:id]).first.nil? then
        flash[:error] = "you cant add two roles for one appraisal period"
      elsif !user.role_users.build(:role_id => params[:role_id][:id], :appraisal_cycles_id => params[:aprsl_cycl_id][:id]).save.nil?
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

def check_selected_attributes()

  total = 0
  params[:kra_attrs_id][:id].each do |id|
      if id != "" 
        total += KraAttr.find(id).weightage
       end
  end
   
  if total >100 
     
     return false
  else
     return true
  end 
  
  end
end
