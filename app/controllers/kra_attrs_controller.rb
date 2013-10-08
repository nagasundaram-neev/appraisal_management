class KraAttrsController < ApplicationController

  before_filter :load, :only => [:new,:index]

  def load
    @kra_attrs = KraAttr.all
    @kra_attr = KraAttr.new
  end
  def new
    
  end

  def index
    
  end
  
  def create
    @kra_attr = KraAttr.new(kra_attr_params)
    #respond_to do |format|

       
      if @kra_attr.save
        flash[:notice] = "Successfully created the KRA Attributes."
        @kra_attrs=KraAttr.all
        #format.html
        #format.js
        #else
        #format.html
      end
    #end
  end

  def edit
    @kra_attr = KraAttr.find(params[:id])
  end

  def show
     @kra_attr = KraAttr.find(params[:id])
  end

  def update
    @kra_attr = KraAttr.find(params[:id])
    if @kra_attr.update(kra_attr_params)
      flash[:notice] = "Successfully updated KRA Attributes."
      @kra_attrs = KraAttr.all
    end
  end
  
  def destroy
    @kra_attr = KraAttr.find { params[:id]  }
    @kra_attr.destroy
    flash[:notice] = "Successfully destroyed."
    @kra_attrs = KraAttr.all
    #format.html
  end
  
  def kra_attr_params
    params.require(:kra_attr).permit(:name, :weightage, :desc, :measures)
  end
end
