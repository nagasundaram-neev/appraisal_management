class AppraisalCyclesController < ApplicationController

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

  def appraisal_cycle_params
    params.require(:appraisal_cycle).permit(:start_date,:end_date)
  end
end
