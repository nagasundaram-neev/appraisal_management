class DrRatingsController < ApplicationController
before_filter :authenticate_user!
skip_before_filter :verify_authenticity_token, :only => [:update]
before_filter :load, :only => [:new,:index]
before_filter :require_appraiser, :only => [:revert_signoff]

  def load
    @dr_ratings = DrRating.all
    @dr_rating = DrRating.new
  end
  def new
    @dr_rating = DrRating.new
  end

  def index
      unless params[:appraisee_id].nil? 
      @flag = params[:appraisee_id][:flag].to_i
      @appraisee_id  = params[:appraisee_id][:id].to_i
      @appraisee= User.find(@appraisee_id)
     else
      @flag= 0
    end
    unless params[:overall_edit_flag].nil?
      @flag = params[:overall_edit_flag].to_i
    end
    unless params[:flag].nil?
      @flag=params[:flag].to_i
    end

    @dr_ratings = DrRating.all
  end

  def create
    @dr_rating = DrRating.new(dr_rating_params)
    if @dr_rating.save
        flash[:notice] = "Successfully saved the ratings."
        @dr_ratings=DrRating.all
    end
  end

  def edit
    @dr_rating = DrRating.find(params[:id])
    @@params_edit_flag= params[:editflag]

    unless params[:appraisee].nil? 
      @@params_appraisee = params[:appraisee]
    else
      @@params_appraisee = nil
    end
  end

  def show
     @dr_rating = DrRating.find(params[:id])
  end

  def update
    @dr_rating= DrRating.find(params[:id])
     @flag=@@params_edit_flag.to_i

     unless @@params_appraisee.nil?
     @appraisee= User.find(@@params_appraisee)
     end
     if @dr_rating.update(dr_rating_params)
        flash[:notice] = "Successfully updated."
        @dr_ratings=DrRating.all
      end
  end

  def destroy
    @dr_rating = DrRating.find (params[:id])
    @dr_rating.destroy
    flash[:notice] = "Successfully destroyed."
    @dr_ratings = DrRating.all
    render :action => 'index'
  end

  def dr_rating_params
    params.require(:dr_rating).permit(:dr_sheet_id, :dr_attr_id, :rating, :comment, :rated_by)
  end

  def revert_signoff
    dr_sheet = DrSheet.find(params[:dr_sheet_id])
    dr_sheet.update_attributes(:appraisee_status => 0)
    flash[:notice] = "Appraisee  notified."
    #notify appraisee
  end

end
