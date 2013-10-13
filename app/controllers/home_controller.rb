class HomeController < ApplicationController

  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
  def get_appraisees
    begin
      if current_user.role == "admin" then
        @appraisees = KraSheet.where(:appraiser_status => 0)
      else
      @appraisees = current_user.appraiser_kra_sheets.where(:appraiser_status => 0)
      end
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
    if current_user.role == "appraiser" then
    @kra_sheets=KraSheet.where(:appraiser_id=>current_user.id, :appraisee_status => 1).order("appraisal_cycle_id DESC") 
    elsif current_user.role == "admin" then
      @kra_sheets = KraSheet.where(:appraisee_status =>1, :appraiser_status => 1).order("appraisal_cycle_id DESC")
    end
  end

end
