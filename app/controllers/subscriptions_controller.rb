class SubscriptionsController < ApplicationController

  def create
    current_user.subscription = Subscription.new(plan_id: 3, user_id: current_user.id)
    if current_user.subscription.save
      flash[:notice] = "Successfully upgraded to Premium plan!"
      redirect_to root_path
    else
      flash[:error] = "Error upgrading to premium plan. Please try again later."
      redirect_to root_path
    end
  end

  def destroy
    subscription = Subscription.find(params[:id])
    if subscription.destroy
      flash[:notice] = "Successfully downgraded to a free plan."
      redirect_to root_path
    else
      flash[:error] = "Error downgrading to free plan. Please try again later."
      redirect_to root_path
    end
  end

end