class HomeController < ApplicationController

  def index
   p "/////////////////////////////////////////////"
   p current_user.id
  
  end
end
