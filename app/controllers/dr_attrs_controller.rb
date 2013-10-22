class DrAttrsController < ApplicationController
	before_filter :load, :only => [:new,:index]

  def load
    @dr_attrs = DrAttr.all
    @dr_attr = DrAttr.new
  end
  def new
    flash[:notice] = nil
  end

  def index
  end

  def create
    @dr_attr = DrAttr.new(dr_attr_params)
    if @dr_attr.total_weightage
      if @dr_attr.save
        flash[:notice] = "A DR Attribute has been successfully created."
        @dr_attrs=DrAttr.all
        else
        flash[:notice] = @dr_attr.errors.full_messages
      end
    else
      flash[:notice] = "cant add this attribute total weightage limit exceeds."
      render "new"
    end
    end

  def edit
    @dr_attr = DrAttr.find(params[:id])
  end

  def show
     @dr_attr = DrAttr.find(params[:id])
  end

  def update
    @dr_attr = DrAttr.find(params[:id])
    if @dr_attr.update(dr_attr_params)
      flash[:notice] = "DR Attribute has been successfully updated."
      @dr_attrs = DrAttr.all
    else
      flash[:notice] = @dr_attr.errors.full_messages
    end
  end
  
  def destroy
    @dr_attr = DrAttr.find (params[:id]) 
    @dr_attr.destroy
    flash[:notice] = "DR Attribute has been successfully destroyed."
    @dr_attrs = DrAttr.all
    
  end
  
  def dr_attr_params
    params.require(:dr_attr).permit(:name, :weightage, :desc)
  end
end
