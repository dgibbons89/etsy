class SubscriptionsController < ApplicationController
def create
  # get params from form
  email = params[:email]
  plan = params[:plan]
  token = params[:stripeToken]
 
  # create a new subscription in the database
  s =  Subscription.new
  s.email = email
  s.plan = plan
  s.stripe_token = token
  s.save
 
  # create a new customer and associate them with a subscription plan
  customer = Stripe::Customer.create(
    :card => token,
    :plan => plan,
    :email => email
  )
  flash[:notice] = "You have created a subscription."
  redirect_to subscriptions_path
 
# handle errors
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to root_path
end
end
