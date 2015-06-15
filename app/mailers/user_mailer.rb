class UserMailer < ApplicationMailer

  # default from: '@example.com'
  #
  # def welcome(user)
	#     @greeting = "Hi #{user.name}"
	#     mail to: user.email
	#   end
  #
  #
  #   def secrets_email(title,description,name,recipients)
  #     recipients    @recipients
  #     from          "My Awesome Site Notifications"
  #     subject       "An important Secret"
  #     sent_on       Time.now
  #     body          {}
  #   end
  def welcome(user)
    @greeting = "Hi #{user.name}"

    mail to: user.email, subject: "Welcome To My Secrets"
  end




end
