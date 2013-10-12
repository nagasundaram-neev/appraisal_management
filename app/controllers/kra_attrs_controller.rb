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
      if @kra_attr.save
        flash[:notice] = "A KRA Attribute has been successfully created."
        @kra_attrs=KraAttr.all
        else
        flash[:notice] = @kra_attr.errors.full_messages
      end
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
      flash[:notice] = "KRA Attribute has been successfully updated."
      @kra_attrs = KraAttr.all
    else
      flash[:notice] = @kra_attr.errors.full_messages
    end
  end
  
  def destroy
    @kra_attr = KraAttr.find (params[:id]) 
    @kra_attr.destroy
    flash[:notice] = "KRA Attribute has been successfully destroyed."
    @kra_attrs = KraAttr.all
    
  end
  
  def kra_attr_params
    params.require(:kra_attr).permit(:name, :weightage, :desc, :measures)
  end
end
