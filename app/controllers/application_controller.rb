class ApplicationController < ActionController::Base
 
  
  # rescue_from CanCan::AccessDenied do |exception|
  #lash[:error]="Access  Denied"
 	#redirect_to root_url
 	#before_action :authenticate_user!
  
   rescue_from CanCan::AccessDenied do | exception |
    byebug
    redirect_to root_url
  end


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery  with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :password) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :email, :password, :current_password, :avatar) }
    end



  #skip_before_filter :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }

  #before_action :authenticate_user!
  #before_action :authorize, :only =>[:edit, :destroy]


 
end
