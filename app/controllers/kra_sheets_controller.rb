class KraSheetsController < ApplicationController
before_filter :authenticate_user!


	before_filter :load, :only => [:new,:index]

  def load
    @kra_sheets = KraSheet.all
    @kra_sheet = KraSheet.new
  end
  def new
  end

  def index
    require_admin
    @kra_sheets = KraSheet.all.order("appraisal_cycle_id DESC")
    @distinct_appraisals = KraSheet.select(:appraisal_cycle_id).distinct.order("appraisal_cycle_id DESC")
    
  end
  
  def create
    @kra_sheet = KraSheet.new(kra_sheet_params)
      if @kra_sheet.save
        Thread.new do
          @kra_sheet.alert_user(@kra_sheet.appraisee_id)
        end
        flash[:notice] = "Successfully created the KRA sheets."
        @kra_sheets=KraSheet.all
      else
        flash[:notice] = @kra_sheet.errors.full_messages
      end
  end

  def edit
    @kra_sheet = KraSheet.find(params[:id])
    @appraiser_list = User.where("role == 'appraiser' and email != #{@kra_sheet.appraisee.email}")
  end

  def show
     @kra_sheet = KraSheet.find(params[:id])
  end

  def update
    @kra_sheet = KraSheet.find(params[:id])
    if @kra_sheet.update(kra_sheet_params)
      flash[:notice] = "Successfully updated KRA sheets."
      @kra_sheets = KraSheet.all.order("appraisal_cycle_id DESC")
      @distinct_appraisals = KraSheet.select(:appraisal_cycle_id).distinct.order("appraisal_cycle_id DESC")
    end
  end

  def destroy
    @kra_sheet = KraSheet.find(params[:id])
    @kra_sheet.destroy
    flash[:notice] = "Successfully destroyed."
    @kra_sheets = KraSheet.all
  end

  def kra_status_update
    @kra_sheet = KraSheet.find(params[:id])
    if @kra_sheet.update_attributes!(:appraisee_status => true)
      notification = Notification.new( :message => "#{@kra_sheet.appraisee.first_name} has signed off his kra form.")
      notification.save
      notification.update_attributes(:sender => @kra_sheet.appraisee)
      notification.users = [@kra_sheet.appraiser]
    end
  end

  def kra_manager_status_update
    @kra_sheet = KraSheet.find(params[:id])
    if @kra_sheet.update_attributes!(:appraiser_status => true)
      notification = Notification.new( :message => "#{@kra_sheet.appraisee.first_name} kra sheet has ben signed off by his kra manager .")
      notification.save
      notification.update_attributes(:sender => @kra_sheet.appraiser)
      notification.users = [User.where(:role => 'admin')]
    end
  end

  def kra_sheet_params
    params.require(:kra_sheet).permit(:appraisal_cycle_id, :appraisee_id, :appraiser_id)
  end

end
