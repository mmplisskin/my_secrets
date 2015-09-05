class UserMailer < ApplicationMailer
      # include Sidekiq::Worker

  def secrets_email(title,description,inac_name,recipient)

      @title = title
      @description = description
      @inac_name = inac_name
      @recipient = recipient
      @greeting = "Hello, #{@recipient}"
      @greeting2 = "We regret to inform you that #{@inac_name} has gone inactive and has a secret for you:"



      mail to: @recipient, subject: "#{@inac_name} has a secret for you "

    end

  def welcome_email(ouser_id)
      @ouser = Ouser.find(ouser_id)
      @email = @ouser.email
      @name = @ouser.name
      @title = "Great to have you #{@ouser.name}"
      @subject = "Welcome! #{@ouser.name}"
      @greeting = "You have made a brilliant decision to keep your digital legacy safe! "
      @info = "Your secrets can contain your social media login, financial accounts, life insurance, or a message to loved ones."
      @info2 = "Please make sure to check in so we know that everything is ok."
    # else
      # @title = "Cheers #{ouser.name}"
      # @subject = "Good to know that everything is still awesome #{ouser.name}!"
      # @greeting = "Welcome back #{ouser.name}. Your secrets are still safe!"
    # end

    mail to: @email, subject: @subject
  end


  def notify_email(title,description,inac_name,recipient)

      @title = title
      @description = description
      @inac_name = inac_name
      @recipient = recipient
      @greeting = "Hello, #{@recipient}"
      @greeting2 = @description



      mail to: @recipient, subject: "#{@inac_name} needs to check in."

    end

    def otp_email(ouser_id, otp_code)
        @ouser = Ouser.find(ouser_id)
        @email = @ouser.email
        @name = @ouser.name
        @title = "Your One time Password #{@ouser.name}"
        @subject = "OTP login! #{@ouser.name}"
        @greeting = "Your One time Password"
        @info = otp_code
        @info2 = "Please make sure to check in so we know that everything is ok."
      # else
        # @title = "Cheers #{ouser.name}"
        # @subject = "Good to know that everything is still awesome #{ouser.name}!"
        # @greeting = "Welcome back #{ouser.name}. Your secrets are still safe!"
      # end

      mail to: @email, subject: @subject
    end





end
