class LongtermGoalsController < ApplicationController
before_filter :authenticate_user!
skip_before_filter :verify_authenticity_token, :only => [:update]
before_filter :load, :only => [:new,:index]


  def load
    @longterm_goals = LongtermGoal.all
    @longterm_goal = LongtermGoal.new
  end
  def new
    @longterm_goal = LongtermGoal.new
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
    
      unless params[:flag].nil?
        @flag=params[:flag].to_i
      end
    
      unless params[:view_flag].nil?
       @flag=@view_flag=params[:view_flag].to_i
      end
    
      unless params[:sheet_id].nil?
        @longterm_sheet=LongtermSheet.find(params[:sheet_id].to_i)
        @longterm_goal=@longterm_sheet.longterm_goals.last
        @plan_sheet=@longterm_sheet.plan_sheets.last
      end

      unless params[:appraisee_sheet_id].nil?
        
        @flag = params[:appraisee_sheet_id][:flag].to_i
        @view_flag=0
        @longterm_sheet=LongtermSheet.find(params[:appraisee_sheet_id][:id].to_i)
        @longterm_goal=@longterm_sheet.longterm_goals.last
        @plan_sheet=@longterm_sheet.plan_sheets.last 
      end

    #@longterm_goals = LongtermGoal.all
  end

  def create
    @longterm_goal = LongtermGoal.new(longterm_goal_params)
    
    if @longterm_goal.save
        @longterm_sheet=LongtermSheet.find(@longterm_goal.longterm_sheet_id)
        
        
        @longterm_sheet.update_attributes(:appraisee_status => 1) 

        @longterm_sheet.plan_sheets.build(:agreed_goal => params[:agreed_goal], :way_to_achieve => params[:way_to_achieve], :resources_required => params[:resources_required],:measure => params[:measure]).save

        params[:curr_implication_id][:id].each do |curr_implication_id| 
          unless curr_implication_id.empty?
            CurrImplication.new(:longterm_sheet_id=>@longterm_sheet.id, :implication_id => curr_implication_id.to_i).save
          end
        end
        params[:next_implication_id][:id].each do |next_implication_id| 
          unless next_implication_id.empty?
            NextImplication.new(:longterm_sheet_id=>@longterm_sheet.id, :implication_id => next_implication_id.to_i).save
          end
        end
        

        flash[:notice] = "Successfully saved"
        @longterm_goal=@longterm_sheet.longterm_goals.last
        @plan_sheet=@longterm_sheet.plan_sheets.last
        @flag=0
    end
  end

  def edit
    @longterm_goal = LongtermGoal.find(params[:id])
    @@params_edit_flag= params[:editflag]

    unless params[:appraisee].nil? 
      @@params_appraisee = params[:appraisee]
    else
      @@params_appraisee = nil
    end
  end

  def show
     @longterm_goal = LongtermGoal.find(params[:id])
  end

  def update
    @longterm_goal= LongtermGoal.find(params[:id])
     @flag=@@params_edit_flag.to_i

     unless @@params_appraisee.nil?
     @appraisee= User.find(@@params_appraisee)
     end
     if @longterm_goal.update(longterm_goal_params)
        flash[:notice] = "Successfully updated."
        @longterm_goals=LongtermGoal.all
      end
  end

  def destroy
    @longterm_goal = LongtermGoal.find (params[:id])
    @longterm_goal.destroy
    flash[:notice] = "Successfully destroyed."
    @longterm_goals = LongtermGoal.all
    render :action => 'index'
  end

  def appraiser_comment_save
    @longterm_goal=LongtermGoal.find(params[:longterm_goal])
    @longterm_goal.update_attributes(:appraiser_comment => params[:appraiser_comment])
  end
  def longterm_goal_params
    params.require(:longterm_goal).permit(:longterm_sheet_id, :prof_goal, :personal_goal, :tech_strength, :non_tech_strength, :tech_imp, :non_tech_imp, :appraiser_comment, :agreed_goal,:curr_implication_id,:next_implication_id,:way_to_achieve,:resources_required,
      :measure)
  end

  # def revert_signoff
  #   @longterm_sheet = LongtermSheet.find(params[:longterm_sheet_id])
   
  #   if @longterm_sheet.update_attributes(:appraisee_status => 0)
  #     Thread.new do
  #       @longterm_sheet.longterm_disagree_notification_mail(@longterm_sheet)
  #     end
  #     flash[:notice] = "Appraisee  notified."
      
  #     notification = Notification.new( :message => "#{@longterm_sheet.appraiser.first_name} is disagree with your ratings please modify them")
  #     notification.save
  #     notification.update_attributes(:sender => @longterm_sheet.appraiser)
  #     notification.users = [@longterm_sheet.appraisee]
  #   else
  #     flash[:notice] = "Sorry something went wrong cant update disagree again"
  #   end
  # end
end



	

