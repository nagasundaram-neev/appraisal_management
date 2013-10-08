class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super    
    user = User.find_by_email(params[:user][:email])
    Role.new.save_role_user(user.id,params[:role_id][:id],params[:aprsl_cycl_id][:id])
    Department.new.save_dept_user(user.id,params[:dept_id][:id])
    UserMailer.welcome_email(user).deliver  
  end

end
