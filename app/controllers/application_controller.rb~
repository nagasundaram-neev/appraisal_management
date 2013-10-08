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
    stored_location_for(:user) || new_user_registration_path
  end
  
  
=begin
 def after_sign_in_path_for(resource)
    p "-------------------------------------------"
      user = User.find_by_email(params[:user][:email])
      if user.user_type == "admin" then
        return edit_user_registration_path
        elsif user.user_type == "appraisee" then
        return static_pages_home_path
        elsif user.user_type == "appraiser" then
        return static_pages_help_path
      end

  end
=end
end

  
