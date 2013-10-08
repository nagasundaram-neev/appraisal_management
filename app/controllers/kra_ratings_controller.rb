class KraRatingsController < ApplicationController

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

	def kra_rating_params
    params.require(:kra_rating).permit(:kra_sheet_id, :kra_attr_id, :rating, :comment, :rated_by)
  end
end
