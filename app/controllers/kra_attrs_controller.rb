class KraAttrsController < ApplicationController

  def index
    @kra_attrs = KraAttr.all
  end

  def create
    @kraattr = KraAttr.new(kraattr_params)
    respond_to do |format|
      if @kraattr.save
        p @kraattr.id
        format.html
        format.js
      else
        format.html
      end
    
    end
  end

  def show
    @kra_attr = KraAttr.find(params[:id])
  end

  def update
    @kra_attr = KraAttr.find(params[:id])
    @kra_attr.update_attributes(kraattr_params)
  end

  def kraattr_params
    params.require(:kraattr).permit(:name, :weightage, :desc, :measures)
  end
end
