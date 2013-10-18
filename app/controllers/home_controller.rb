class HomeController < ApplicationController
include AppraisalCyclesHelper
  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      unless current_user.role == 'admin'
        total_performance_graph
        performance_graph
      else
        @users=User.where('first_name LIKE ? OR email LIKE ? OR phone_no LIKE ? ','%'+params[:search].to_s+'%','%'+params[:search].to_s+'%','%'+params[:search].to_s+'%')
      end
    end
  end
  def get_dr_appraisees
    begin
      if current_user.role == "admin" then
        @appraisees = DrSheet.where("appraiser_status = 0 or appraisee_status = 0")
      elsif current_user.role == "appraiser"
        @appraisees = current_user.appraiser_dr_sheets.where(:appraiser_status => 0)
      end
      if @appraisees.first.nil? then
        return @appraisees = nil
      else
        return @appraisees
      end
    rescue
      return nil
    end
  end



  def get_appraisees
    begin
      if current_user.role == "admin" then
        @appraisees = KraSheet.where("appraiser_status = 0 or appraisee_status = 0")
      elsif current_user.role == "appraiser"
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
    @kra_sheets=KraSheet.where( :appraiser_id=>current_user.id,:appraisee_status => 1, :appraiser_status => 1).order("appraisal_cycle_id DESC") 
    elsif current_user.role == "admin" then
      @kra_sheets = KraSheet.where(:appraisee_status =>1, :appraiser_status => 1).order("appraisal_cycle_id DESC")
    end
  end

  def get_past_dr_appraisees
    if current_user.role == "appraiser" then
    @dr_sheets=DrSheet.where(:appraiser_id=>current_user.id, :appraisee_status => 1, :appraiser_status => 1).order("appraisal_cycle_id DESC") 
    elsif current_user.role == "admin" then
      @dr_sheets = DrSheet.where(:appraisee_status =>1, :appraiser_status => 1).order("appraisal_cycle_id DESC")
    end
  end


  def total_performance_graph
    @graph_belongs_to=current_user
    @kra_sheets=current_user.kra_sheets.where(:appraisee_status=>1,:appraiser_status=>1)
    unless @kra_sheets.empty?
      @performance_manager_array=[]
      @performance_self_array=[]
      @dr_sheets=current_user.dr_sheets.where(:appraisee_status=>1,:appraiser_status=>1)
      @kra_sheets.each do |kra_sheet|
      @kra_sheet_temp = kra_sheet
        unless overall_sum_manager == 0
          @performance_manager_array << overall_sum_manager
        end
        unless overall_sum_self == 0 
          @performance_self_array << overall_sum_self  
        end
      @cycles=AppraisalCycle.where(:id=> current_user.kra_sheets.select(:appraisal_cycle_id).collect(&:appraisal_cycle_id)).select(:start_date).collect(&:start_date)
      end
    else
      flash[:notice]= "No Appraisal Published for you"
    end
  end

    def performance_graph
      @kra_sheet=KraSheet.where(:appraisee_id => current_user.id,:appraisee_status=>1,:appraiser_status=>1).last
      unless @kra_sheet.nil?
        @kra_ratings_by_manager_array=KraRating.where(:kra_sheet_id => @kra_sheet.id, :rated_by => 1).select(:rating).map(&:rating)
        @kra_ratings_by_self_array=KraRating.where(:kra_sheet_id => @kra_sheet.id, :rated_by => 0).select(:rating).map(&:rating)
        @kra_ratings_by_self_array.map! { |x| x == nil ? 0 : x }
        @kra_ratings_by_manager_array.map! { |x| x == nil ? 0 : x }
        @rating_list=KraRating.where(:kra_sheet_id => @kra_sheet.id, :rated_by => 1)
        @kra_attr_list = current_user.roles.last.kra_attrs.select(:name).collect(&:name)
      else
        flash[:notice]= "No Appraisal Published for you"
      end
  end

  def get_notifications
    @notifications = []
    begin
      all_notifications = current_user.notifications
    rescue NoMethodError
      all_notifications = nil
    end
    unless all_notifications.nil?
      @notifications = all_notifications.where("notifications.created_at > (?)", current_user.last_sign_in_at)
    end
  end

end
