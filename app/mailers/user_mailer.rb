class UserMailer < ActionMailer::Base
  default from: "rorappraisal@gmail.com"

  def welcome_email(user,password)
  	@user = user
  	@email = user.email
  	@password=password
  	@url = "http://10.132.161.72:3000/users/sign_in	"
  	mail(to: @user.email, subject:"Login to your appraisal portal")
  end
  def new_aprsl_email(user)
  	@user = user
  	@email = user.email
  	
  	@url = "http://localhost:3000/users/sign_in	"
  	mail(to: @user.email, subject:"Fill New appraisal forms")
  end

  def kra_revert_signoff_email(appraisee,appraiser,appraisal_cycle)
    @user=appraisee
    @email=appraisee.email
    @appraisal_cycle="From #{appraisal_cycle.start_date.strftime('%B %Y')} to #{appraisal_cycle.end_date.strftime('%B %Y')}"
    @appraiser_name = "#{appraiser.first_name}  #{appraiser.last_name}"
    mail(to: @user.email, subject: "Your KRA form disagreed by your appraiser #{@appraiser_name}")
  end
def dr_revert_signoff_email(appraisee,appraiser,appraisal_cycle)
    @user=appraisee
    @email=appraisee.email
    @appraisal_cycle="From #{appraisal_cycle.start_date.strftime('%B %Y')} to #{appraisal_cycle.end_date.strftime('%B %Y')}"
    @appraiser_name = "#{appraiser.first_name}  #{appraiser.last_name}"
    mail(to: @user.email, subject: "Your DR form disagreed by your appraiser #{@appraiser_name}")
  end

end
