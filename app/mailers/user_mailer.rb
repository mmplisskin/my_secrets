class UserMailer < ApplicationMailer
      # include Sidekiq::Worker

  def secrets_email(title,description,inac_name,recipient)

      @title = title
      @description = description
      @inac_name = inac_name
      @recipient = recipient
      @greeting = "Hello, #{@inac_name} has a mesage for you from beyond time. #{@title}, #{@description}, "


      mail to: @recipient, subject: "#{@inac_name} has a secret for you "

    end

  def welcome_email(ouser_id)
      @ouser = Ouser.find(ouser_id)
      @email = @ouser.email
      @title = "Great to have you #{@ouser.name}"
      @subject = "Welcome! #{@ouser.name}"
      @greeting = "Congrats  #{@ouser.name}. You have made a brilliant decision to keep your digital legacy safe! "
    # else
      # @title = "Cheers #{ouser.name}"
      # @subject = "Good to know that everything is still awesome #{ouser.name}!"
      # @greeting = "Welcome back #{ouser.name}. Your secrets are still safe!"
    # end

    mail to: @email, subject: @subject
  end




end
