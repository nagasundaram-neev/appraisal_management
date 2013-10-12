class HomeController < ApplicationController

  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
  def get_appraisees
    begin
      @appraisees = current_user.appraiser_kra_sheets.where(:appraiser_status => 0)
      if @appraisees.first.nil? then
        return nil
      else
        return @appraisees
      end
    rescue
      return nil
    end
  end
  def get_past_appraisees
  	@kra_sheets=KraSheet.where(:appraiser_id=>current_user.id, :appraisee_status => 1)
  end
end
