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
    @@params_edit_flag= params[:editflag]

    unless params[:appraisee].nil? 
      @@params_appraisee = params[:appraisee]
    else
      @@params_appraisee = nil
    end

  end

  def show
     @kra_rating = KraRating.find(params[:id])
  end

  def update
    @kra_rating= KraRating.find(params[:id])
    
     
     @flag=@@params_edit_flag.to_i

     unless @@params_appraisee.nil?
     @appraisee= User.find(@@params_appraisee)
     end
     if @kra_rating.update(kra_rating_params)
       
        flash[:notice] = "Successfully updated."
        @kra_ratings=KraRating.all
      end

    
  end
  
  def destroy
    @kra_rating = KraRating.find (params[:id])
    @kra_rating.destroy
    flash[:notice] = "Successfully destroyed."
    @kra_ratings = KraRating.all
    render :action => 'index'
  end

	def kra_rating_params
    params.require(:kra_rating).permit(:kra_sheet_id, :kra_attr_id, :rating, :comment, :rated_by)
  end
end
