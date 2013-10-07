class KraAttrsController < ApplicationController

  def index
    @kra_attrs = KraAttr.all
  end

  def create
    @kraattr = KraAttr.new(params[:name])
    p "before save           "
    respond_to do |format|
      if @kraattr.save
        p "doing"
        p @kraattr.id
        format.html
        format.js
      else
        p "not doing wrong"
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
