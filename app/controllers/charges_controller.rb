class ChargesController < ApplicationController

  def new
  end

  def create
    @amount = 199 # amount in cents

    customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
      )

    charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: "Premium plan subscription",
        currency: "USD"
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end

end
