class ImplicationsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :require_admin

  before_filter :load, :only => [:new,:index, :create, :update]
  before_filter :create_new_implication, :only => [:new,:index]

  def load
    @implications = Implication.all
  end

  def create_new_implication
    @implication = Implication.new
  end

  def new
    flash[:notice] = nil
  end


  def index    
  end

  def create
    @implication = Implication.new(implication_params)
      if @implication.save
        @implications = Implication.all
        flash[:notice] = "A New Implication has been Successfully Created."
      else
        flash[:notice] = @implication.errors.full_messages
      end
  end

  def edit 
  	@implication = Implication.find(params[:id])
  end

  def show
    @implication = Implication.find(params[:id])
  end

  def update
    @implication = Implication.find(params[:id])
    if @implication.update_attributes(implication_params)
      flash[:notice] = "Implication has been Successfully Updated."
      @implications = Implication.all
    else
      flash[:notice] = @implication.errors.full_messages
    end
  end

  def destroy
    @implication = Implication.find(params[:id])
    @implication.destroy
    flash[:notice] = "Implication Successfully destroyed."
    @implications = Implication.all
  end

  def implication_params
    params.require(:implication).permit(:name)
  end
end
