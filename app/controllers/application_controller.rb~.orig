class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name, :gender, :phone_no,:role) }
  end
  protect_from_forgery with: :exception
  
  protected

  def after_sign_in_path_for(resource)
    stored_location_for(:user) || root_path
  end

  private

  def after_sign_out_path_for(resource)
    stored_location_for(:user) || new_user_session_path
  end
  
  def require_admin
    unless current_user && current_user.role == 'admin'
      flash[:error] = "You are not an admin"
      redirect_to root_path
    end        
  end
end

  
