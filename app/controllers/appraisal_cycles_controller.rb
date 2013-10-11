class AppraisalCyclesController < ApplicationController
  
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
      flash[:notice] = "New Appraisal Cycle has been Successfully created."
      @appraisal_cycles = AppraisalCycle.all
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
    @appraisal_cycles = AppraisalCycle.all
  end

  def overall_performance
    #p params[:appraisal_cycle][:id] unless params[:appraisal_cycle].nil?
    unless params[:appraisal_cycle].nil?
      @appraisals=AppraisalCycle.find(params[:appraisal_cycle][:id]) unless params[:appraisal_cycle].nil?
      #p @appraisals.start_date unless @appraisals.nil?
      @kra_sheets=KraSheet.where(:appraisal_cycle_id => @appraisals.id, :appraisee_id => current_user.id)
      p @kra_sheets
    end
  end

  def performance_params
    params.require(:appraisal_cycle).permit(:appraisal_cycle_id)
  end

  def appraisal_cycle_params
    params.require(:appraisal_cycle).permit(:start_date,:end_date)
  end

end
