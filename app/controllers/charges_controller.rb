class ChargesController < ApplicationController
  # require 'pry'
  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'My Secrets yearly payment.',
      :currency    => 'usd'
    )
  user = Ouser.find(current_ouser.id)
  user.paid = true
  user.last_payment = Time.now
  user.save
  flash[:notice] = "Thanks for your paying!"
  redirect_to posts_path
  # ouser.save!
  # binding.pry

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end


end
