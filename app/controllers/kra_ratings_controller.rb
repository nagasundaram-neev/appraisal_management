class KraRatingsController < ApplicationController
before_filter :authenticate_user!

before_filter :load, :only => [:new,:index]

  def load
    @kra_ratings = KraRating.all
    @kra_rating = KraRating.new
  end
  def new
    
  end

  def index
    
  end
def create
    @kra_rating = KraRating.new(kra_rating_params)
    respond_to do |format|
      if @kra_rating.save
        flash[:notice] = "Successfully created the KRA Attributes."
        @kra_ratings=KraRating.all
        format.html
        format.js
        else
        format.html
      end
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
    if @kra_rating.update(kra_rating_params)
      flash[:notice] = "Successfully updated."
      @kra_ratings = KraAttr.all
    end
  end
  
  def destroy
    @kra_rating = KraRating.find { params[:id]  }
    @kra_rating.destroy
    flash[:notice] = "Successfully destroyed."
    @kra_ratings = KraAttr.all
    #format.html
  end

	def kra_rating_params
    params.require(:kra_rating).permit(:kra_sheet_id, :kra_attr_id, :rating, :comment, :rated_by)
  end
end
