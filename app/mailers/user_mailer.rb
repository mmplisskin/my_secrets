class UserMailer < ApplicationMailer

  # default from: '@example.com'
  #
  # def welcome(user)
	#     @greeting = "Hi #{user.name}"
	#     mail to: user.email
	#   end

    def secrets_email(title,description,name,email, recipient)
        @name = name
        @title = title
        @description = description
        @name = name
        @recipient = recipient
        @greeting = "Hello, #{@name} has a mesage for you from beyond time. #{@title}, #{description}"


        mail to: recipient, subject: "#{@name} has a secret for you "

    end

  def welcome(user)
    @greeting = "Hi #{user.name}"

    mail to: user.email, subject: "Welcome To My Secrets"
  end




end
