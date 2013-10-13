class KraRatingsController < ApplicationController
before_filter :authenticate_user!
skip_before_filter :verify_authenticity_token, :only => [:update]
before_filter :load, :only => [:new,:index]

  def load
    @kra_ratings = KraRating.all
    @kra_rating = KraRating.new
  end

  def new
    @kra_rating = KraRating.new
  end

  def index
    if current_user.kra_sheets.where(:appraisee_status => 0).first.nil?
      flash[:notice] = "Cuurntly there is no appraisal ."
      #redirect_to root_path
      return
    end
    @flag = params[:appraisee_id][:flag]
    @appraisee_id  = params[:appraisee_id][:id]
    @kra_ratings = KraRating.all
  end

  def create
    @kra_rating = KraRating.new(kra_rating_params)
    if @kra_rating.save
        flash[:notice] = "Successfully saved the ratings."
        @kra_ratings=KraRating.all
    end
  end

  def edit
    @kra_rating = KraRating.find(params[:id])
  end

  def show
     @kra_rating = KraRating.find(params[:id])
  end

  def update
    @kra_rating= KraRating.find(params[:id])
     respond_to do |format|
     if @kra_rating.update(kra_rating_params)
        format.js {}
        format.html {}
        flash[:notice] = "Successfully updated."
        @kra_ratings=KraRating.all
      end
    end
  end

  def destroy
    @kra_rating = KraRating.find (params[:id])
    @kra_rating.destroy
    flash[:notice] = "Successfully destroyed."
    @kra_ratings = Krarating.all
    render :action => 'index'
  end

  def kra_rating_params
    params.require(:kra_rating).permit(:kra_sheet_id, :kra_attr_id, :rating, :comment, :rated_by)
  end
end
