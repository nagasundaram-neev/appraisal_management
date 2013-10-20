class LongtermSheetsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :load, :only => [:new,:index]

	def load
    @longterm_sheets = LongtermSheet.all
    @longterm_sheet = LongtermSheet.new
  end
  def new
  end

  def index
    require_admin
    @longterm_sheets = LongtermSheet.all.order("appraisal_cycle_id DESC")
    @distinct_appraisals = LongtermSheet.select(:appraisal_cycle_id).distinct.order("appraisal_cycle_id DESC")
  end

  def create
    @longterm_sheet = LongtermSheet.new(longterm_sheet_params)
      if @longterm_sheet.save
        Thread.new do
          @longterm_sheet.alert_user(@longterm_sheet.appraisee_id)
        end
        flash[:notice] = "Successfully created the Longterm sheets."
        @longterm_sheets=LongtermSheet.all
      else
        flash[:notice] = @longterm_sheet.errors.full_messages
      end
  end

  def edit
    @longterm_sheet = LongtermSheet.find(params[:id])
  end

  def show
     @longterm_sheet = LongtermSheet.find(params[:id])
  end

  def update
    @longterm_sheet = LongtermSheet.find(params[:id])
    if @longterm_sheet.update(longterm_sheet_params)
      flash[:notice] = "Successfully updated Longterm sheets."
      @longterm_sheets = LongtermSheet.all
      @distinct_appraisals = LongtermSheet.select(:appraisal_cycle_id).distinct.order("appraisal_cycle_id DESC")
    end
  end

  def destroy
    @longterm_sheet = LongtermSheet.find(params[:id])
    @longterm_sheet.destroy
    flash[:notice] = "Successfully destroyed."
    @longterm_sheets = LongtermSheet.all
  end

  # def longterm_status_update
  #   @longterm_sheet = LongtermSheet.find(params[:id])
  #   @longterm_sheet.update_attributes!(:appraisee_status => true)
  # end

  def longterm_sheet_signoff 
      @longterm_sheet = LongtermSheet.find(params[:longterm_sheet])
      @longterm_sheet.update_attributes!(:appraisee_status => 1) #Longterm sheet submitted 
  end

 

  def longterm_sheet_params
    params.require(:longterm_sheet).permit(:appraisal_cycle_id, :appraisee_id, :appraiser_id)
  end

end





