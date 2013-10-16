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
end
