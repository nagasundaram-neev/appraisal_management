class AppraisalCyclesController < ApplicationController
  include AppraisalCyclesHelper
  before_filter :authenticate_user!
  before_filter :load, :only => [:new,:index, :create, :update]
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
  end

  

  def create
    @appraisal_cycle = AppraisalCycle.new(appraisal_cycle_params)
    
    if @appraisal_cycle.save
      flash[:notice] = "Successfully created."
    
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
      flash[:notice] = "Successfully updated."
      @appraisal_cycles = AppraisalCycle.all
    end
  end
  def destroy
    @appraisal_cycle = AppraisalCycle.find(params[:id])
    @appraisal_cycle.destroy
    flash[:notice] = "Successfully destroyed post."
    @appraisal_cycles = AppraisalCycle.all
  end

  def overall_performance
    unless params[:appraisal_cycle].nil?
      @appraisals=AppraisalCycle.find(params[:appraisal_cycle][:id]) unless params[:appraisal_cycle].nil?
      @kra_sheets=KraSheet.where(:appraisal_cycle_id => @appraisals.id, :appraisee_id => current_user.id)
      @kra_sheet_temp=KraSheet.where(:appraisal_cycle_id => @appraisals.id, :appraisee_id => current_user.id).last    
    end
  end

  def total_performance_graph
    

  end

  def performance_graph
    @kra_sheet=KraSheet.find_by_appraisee_id(current_user.id)
    @kra_ratings_by_manager_array=KraRating.where(:kra_sheet_id => @kra_sheet.id, :rated_by => 1).select(:rating).map(&:rating)
    @kra_ratings_by_self_array=KraRating.where(:kra_sheet_id => @kra_sheet.id, :rated_by => 0).select(:rating).map(&:rating)
    @kra_ratings_by_self_array.map! { |x| x == nil ? 0 : x }
    @kra_ratings_by_manager_array.map! { |x| x == nil ? 0 : x }
    @rating_list=KraRating.where(:kra_sheet_id => @kra_sheet.id, :rated_by => 1)
  end

  def performance_params
    params.require(:appraisal_cycle).permit(:appraisal_cycle_id)
  end

  def appraisal_cycle_params
    params.require(:appraisal_cycle).permit(:start_date,:end_date)
  end

end
