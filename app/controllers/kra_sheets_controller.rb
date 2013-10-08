class KraSheetsController < ApplicationController

	before_filter :load, :only => [:new,:index]

  def load
    @kra_sheets = KraSheet.all
    @kra_sheet = KraSheet.new
  end
  def new
    
  end

  def index
    
  end
  
  def create
    @kra_sheet = KraSheet.new(kra_sheet_params)
    respond_to do |format|
      if @kra_sheet.save
        @kra_sheet.alert_user(@kra_sheet.appraisee_id)
        flash[:notice] = "Successfully created the KRA Attributes."
        @kra_sheets=KraSheet.all
        format.html
        format.js
        else
        format.html
      end
    end
  end

  def edit
    @kra_sheet = KraSheet.find(params[:id])
  end

  def show
     @kra_sheet = KraSheet.find(params[:id])
  end

  def update
    @kra_sheet = KraSheet.find(params[:id])
    if @kra_sheet.update(kra_sheet_params)
      flash[:notice] = "Successfully updated KRA Attributes."
      @kra_sheets = KraSheet.all
    end
  end
  
  def destroy
    @kra_sheet = KraSheet.find { params[:id]  }
    @kra_sheet.destroy
    flash[:notice] = "Successfully destroyed."
    @kra_sheets = KraSheet.all
    #format.html
  end
  
  def kra_sheet_params
    params.require(:kra_sheet).permit(:appraisal_cycle_id, :appraisee_id, :appraiser_id)
  end

end
