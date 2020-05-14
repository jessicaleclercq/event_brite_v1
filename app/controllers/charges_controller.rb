class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.find(params[:id])
  end

  def create
    # Amount in cents
    @event = Event.find(params[:id])

    @amount = @event.price * 100
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Inscription à #{@event.title}",
      currency: 'eur',
    })

    @guest = Attendance.create(stripe_customer_id: customer.id, user_id: current_user.id, event_id: @event.id)

    puts @guest.errors.full_messages
    
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    
    redirect_to root_path
  end
end