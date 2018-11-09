class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  

  protected

  def logged_in_only
    
    unless user_signed_in?
      flash[:warning] = "You need to Sign in first"
    redirect_to root_url 

    end
   end
   
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth, :gender, :password, :email])
  end
end
