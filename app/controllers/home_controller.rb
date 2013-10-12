class HomeController < ApplicationController

  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
  def get_appraisees
  end
  def get_past_appraisees
  	@kra_sheets=KraSheet.where(:appraiser_id=>current_user.id, :appraisee_status => 1)
  end
end
