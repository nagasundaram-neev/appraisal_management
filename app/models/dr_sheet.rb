class DrSheet < ActiveRecord::Base

	belongs_to :appraisee, :foreign_key => "appraisee_id", :class_name => "User"
  belongs_to :appraiser, :foreign_key => "appraiser_id", :class_name => "User"
  belongs_to :appraisal_cycle

  def find_appraisee_name
  	@user=User.find(self.appraisee_id)
  	@user.first_name
  end

  def find_appraiser_name
  	unless self.appraiser.nil?
    @user=self.appraiser
    @user.first_name
  else
    "No appraiser assigned"
    end
  end

  def find_cycle
    @appraisal_cycle=AppraisalCycle.find(self.appraisal_cycle_id)
  	@appraisal_cycle.start_date.to_s+" to " + @appraisal_cycle.end_date.to_s
  end

  def alert_user(id)
    user = User.find(id)
    UserMailer.new_aprsl_email(user).deliver
  end

  def dr_disagree_notification_mail(dr_sheet)
    appraisee = User.find(dr_sheet.appraisee_id)
    appraiser=User.find(dr_sheet.appraiser_id)
    appraial_cycle=AppraisalCycle.find(dr_sheet.appraisal_cycle_id)
    UserMailer.dr_revert_signoff_email(appraisee,appraiser,appraisal_cycle).deliver
 end

end
