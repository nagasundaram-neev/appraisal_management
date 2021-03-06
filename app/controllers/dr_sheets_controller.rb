class DrSheetsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :load, :only => [:new,:index]

	def load
    @dr_sheets = DrSheet.all
    @dr_sheet = DrSheet.new
  end
  def new
  end

  def index
    require_admin
    @dr_sheets = DrSheet.all.order("appraisal_cycle_id DESC")
    @distinct_appraisals = DrSheet.select(:appraisal_cycle_id).distinct.order("appraisal_cycle_id DESC")
  end

  def create
    @dr_sheet = DrSheet.new(dr_sheet_params)
      if @dr_sheet.save
        Thread.new do
          @dr_sheet.alert_user(@dr_sheet.appraisee_id)
        end
        flash[:notice] = "Successfully created the DR sheets."
        @dr_sheets=DrSheet.all
      else
        flash[:notice] = @dr_sheet.errors.full_messages
      end
  end

  def edit
    @dr_sheet = DrSheet.find(params[:id])
  end

  def show
     @dr_sheet = DrSheet.find(params[:id])
  end

  def update
    @dr_sheet = DrSheet.find(params[:id])
    if @dr_sheet.update(dr_sheet_params)
      @longterm_sheet=LongtermSheet.where(:appraisee_id => @dr_sheet.appraisee_id, :appraisal_cycle_id => @dr_sheet.appraisal_cycle_id).last
      @longterm_sheet.update_attributes(:appraiser_id => @dr_sheet.appraiser_id)
      flash[:notice] = "Successfully updated DR sheets."
      @dr_sheets = DrSheet.all
      @distinct_appraisals = DrSheet.select(:appraisal_cycle_id).distinct.order("appraisal_cycle_id DESC")
    end
  end

  def destroy
    @dr_sheet = DrSheet.find(params[:id])
    @dr_sheet.destroy
    flash[:notice] = "Successfully destroyed."
    @dr_sheets = DrSheet.all
  end

  def dr_status_update
    @dr_sheet = DrSheet.find(params[:id])
    if @dr_sheet.update_attributes!(:appraisee_status => true)
      notification = Notification.new( :message => "#{@dr_sheet.appraisee.first_name} has signed off his dr form.")
      notification.save
      notification.update_attributes(:sender => @dr_sheet.appraisee)
      notification.users = [@dr_sheet.appraiser]
    end
  end

  def dr_manager_status_update
    @dr_sheet = DrSheet.find(params[:id])
    if @dr_sheet.update_attributes!(:appraiser_status => true)
      notification = Notification.new( :message => "#{@dr_sheet.appraisee.first_name} dr sheet has ben signed off by his dr manager .")
      notification.save
      notification.update_attributes(:sender => @dr_sheet.appraiser)
      notification.users = [User.where(:role => 'admin')]
    end
  end

  def dr_sheet_params
    params.require(:dr_sheet).permit(:appraisal_cycle_id, :appraisee_id, :appraiser_id)
  end

end
