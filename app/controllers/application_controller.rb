class ApplicationController < ActionController::Base
  
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  #after_action :verify_authorized, :except => :index ## This raises an error for every action that isn't authorized

  #rescue_from Exception, :with => :render_404

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :name, :email] 
    #devise_parameter_sanitizer.for(:account_update) << [:username, :name, subscription_attributes: [:id, :plan_id]]
    devise_parameter_sanitizer.for(:account_update) << [:username, :name, :email, subscription_attributes: [:id, :plan_id, plan_attributes: [:id, :name]]]
    

    # devise_parameter_sanitizer.for( :account_update ) do |u|
    #   u.permit :email, :password, :username, :name, :current_password, :password_confirmation, :first_name, :last_name, subscription_attributes: [:plan_id, :subscription_id]
    # end

  end

  #private

  #def render_404(exception = nil)
    #logger.info "Exception, redirecting: #{exception.message}" if exception
    #render(:action => :index)
  #end

end