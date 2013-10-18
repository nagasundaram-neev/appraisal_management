class AppraisalCyclesController < ApplicationController
  include AppraisalCyclesHelper
  before_filter :authenticate_user!
  before_filter :load, :only => [:new,:create, :update]
  before_filter :create_new_appraisal_cycle, :only => [:new,:index]

  def load
    @appraisal_cycles = AppraisalCycle.all
  end

  def create_new_appraisal_cycle
    @appraisal_cycle = AppraisalCycle.new
  end

  def new
  end

  def index
    if current_user.role == "admin"
      @appraisal_cycles = AppraisalCycle.all.order("start_date DESC")
    else
      @kra_appraisal_cycles = current_user.kra_sheets.where(:appraiser_status => 1).order("start_date DESC")
      @dr_appraisal_cycles = current_user.dr_sheets.where(:appraiser_status => 1).order("start_date DESC")
    end
  end

  def create
    @appraisal_cycle = AppraisalCycle.new(appraisal_cycle_params)
    if @appraisal_cycle.save
      flash[:notice] = "New Appraisal Cycle has been Successfully created."
      @users_without_kraprsrs = []
      @users_without_draprsrs = []
      p "------------------------"
      p"calling create_kra_sheets"
      @users_without_kraprsrs = @appraisal_cycle.create_kra_sheets
      p "back from create_kra_sheets my users_without_kraprsrs count"
      p @users_without_kraprsrs.count
      @users_without_kraprsrs.each do |user|
        p user.first_name
      end

      @users_without_draprsrs = @appraisal_cycle.create_dr_sheets
      @appraisal_cycles = AppraisalCycle.all.order("start_date DESC")
    else
        flash[:notice] = @appraisal_cycle.errors.full_messages
    end
  end

  def edit
      @appraisal_cycle = AppraisalCycle.find(params[:id])
  end

  def show
    @appraisal_cycle = AppraisalCycle.find(params[:id])
  end

  def update
    @appraisal_cycle = AppraisalCycle.find(params[:id])
    if @appraisal_cycle.update(appraisal_cycle_params)
      flash[:notice] = "Appraisal Cycle has been successfully updated."
      @appraisal_cycles = AppraisalCycle.all
    else
      flash[:notice] = @appraisal_cycle.errors.full_messages
    end
  end
  def destroy
    @appraisal_cycle = AppraisalCycle.find(params[:id])
    @appraisal_cycle.destroy
    flash[:notice] = "Successfully removed."
    @appraisal_cycles = AppraisalCycle.all.order("start_date DESC")
  end

  def overall_performance
    unless params[:appraisal_cycle].nil?
      @flag=params[:appraisal_cycle][:flag]
      if params[:appraisal_cycle][:flag]=="0"# appraisee is loged in 
        @kra_sheets=KraSheet.where(:appraisal_cycle_id => params[:appraisal_cycle][:id], :appraisee_id => current_user.id)
        @kra_sheet_temp=@kra_sheets.last
      else
        @kra_sheets = KraSheet.where(:id => params[:appraisal_cycle][:id])
        @kra_sheet_temp = @kra_sheets.last
      end
        @appraiser=User.find(@kra_sheets.last.appraiser_id)
        @appraisee=User.find(@kra_sheets.last.appraisee_id)
    end
  end

  def dr_overall_performance
    @flag=params[:dr_sheet][:flag]
    @dr_sheet=DrSheet.find(params[:dr_sheet][:id])
    @dr_ratings=DrRating.where(:dr_sheet_id=>params[:dr_sheet][:id])
  end

  def total_performance_graph
    @performance_manager_array=[]
    @performance_self_array=[]
    if current_user.role=="admin"
      @kra_sheets=KraSheet.where(:appraisee_id=> params[:user],:appraisee_status=>1,:appraiser_status=>1)
      @dr_sheets=DrSheet.where(:appraisee_id=>params[:user],:appraisee_status=>1,:appraiser_status=>1)
      @graph_belongs_to=User.find(params[:user])
    else
      @kra_sheets=current_user.kra_sheets.where(:appraisee_status=>1,:appraiser_status=>1)
      @dr_sheets=current_user.dr_sheets.where(:appraisee_status=>1,:appraiser_status=>1)
      @graph_belongs_to=current_user
    end
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
  end

  def performance_graph
    @kra_ratings_by_manager_array=current_user.kra_sheets.last.kra_ratings.where(:rated_by=>1).select(:rating).map(&:rating)
    @kra_ratings_by_self_array=current_user.kra_sheets.last.kra_ratings.where(:rated_by=>0).select(:rating).map(&:rating)
    @kra_ratings_by_self_array.map! { |x| x == nil ? 0 : x }
    @kra_ratings_by_manager_array.map! { |x| x == nil ? 0 : x }
    @rating_list=KraRating.where(:kra_sheet_id => @kra_sheet.id, :rated_by => 1)
    @kra_attr_list = current_user.roles.last.kra_attrs.select(:name).collect(&:name)
  end

  def past_appraisal_performance 
    if current_user.role == "admin"
      @appraisal_cycles = AppraisalCycle.all.order("start_date DESC")
    else
      @dr_appraisal=current_user.dr_sheets.where(:appraiser_status=>1,:appraisee_status=>1).select(:appraisal_cycle_id).collect(&:appraisal_cycle_id)
      @kra_appraisal=current_user.kra_sheets.where(:appraiser_status=>1,:appraisee_status=>1).select(:appraisal_cycle_id).collect(&:appraisal_cycle_id)
      cycles=@dr_appraisal & @kra_appraisal  
      @appraisal_cycles=AppraisalCycle.where(:id=> cycles) 
    end
  end

  def past_appraisal_summary
    @period= params[:appraisal][:id]
    @user= params[:appraisal][:user]
    @kra_sheet_temp=KraSheet.where(:appraisal_cycle_id=>params[:appraisal][:id],:appraisee_id=>params[:appraisal][:user]).last
    @dr_sheet=DrSheet.where(:appraisal_cycle_id=>params[:appraisal][:id],:appraisee_id=>params[:appraisal][:user]).last
    @dr_ratings=DrRating.where(:dr_sheet_id=>@dr_sheet.id)
  end

  def performance_params
    params.require(:appraisal_cycle).permit(:appraisal_cycle_id)
  end

  def appraisal_cycle_params
    params.require(:appraisal_cycle).permit(:start_date,:end_date)
  end

end
