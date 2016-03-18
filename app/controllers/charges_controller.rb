class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Blocipedia Premium Membership - #{current_user.email}",
     amount: 15_00
    }
  end

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
    customer: customer.id, # Note -- this is NOT the user_id in your app
    amount: 15_00,
    description: "Blocipedia Premium Membership - #{current_user.email}",
    currency: 'usd'
    )


    current_user.update_attributes(role: "premium")
    # current_user.role = "premium"
    # current_user.save
    flash[:notice] = "Thanks for upgrading, #{current_user.email}!  Hope you enjoy!"
    redirect_to wikis_path # or wherever

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash.now[:alert] = e.message
    redirect_to new_charge_path
  end
end
