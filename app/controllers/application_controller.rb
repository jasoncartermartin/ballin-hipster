class ApplicationController < ActionController::Base
  
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  #after_action :verify_authorized, :except => :index ## This raises an error for every action that isn't authorized

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :name, :email] 
    #devise_parameter_sanitizer.for(:account_update) << [:username, :name, subscription_attributes: [:id, :plan_id]]
    devise_parameter_sanitizer.for(:account_update) << [:username, 
                                                        :name, 
                                                        :email, 
                                                        subscription_attributes: [:id, :plan_id, 
                                                                                  plan_attributes: [:id, :name]]]
  end

  private

  def not_authorized
    flash[:error] = "You are not authorized to do this!"
    redirect_to request.headers["Referer"] || root_path
  end

end