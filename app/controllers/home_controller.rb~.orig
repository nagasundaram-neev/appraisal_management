class HomeController < ApplicationController

  def index
  if !user_signed_in? 
  p current_user.role
  redirect_to new_user_session_path
 end 
  end
end
