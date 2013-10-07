class UsersController < Devise::UsersController

  def add_role
    @user  = User.find(params[:id])
    @role_user = @user.user_roles.build(:role_id => params[:role_id], :appraisal_cycles_id => params[:aprsl_cycl_id])
    @role_user.save
  end
  def new_role
  end

  def new_dept
  end

  def add_dept
    @user = User.find(params[:id])
    @dept_user = @user.department_users.build(:department_id => params[:dept_id])
    @dept_user.save
  end

end
