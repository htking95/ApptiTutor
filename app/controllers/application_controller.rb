class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

rescue_from ActiveRecord::RecordNotFound do
  flash[:warning] = 'Resource not found.'
  redirect_back_or root_path
end

  #before_action :configure_permitted_parameters, if: :devise_controller?

def redirect_back_or(path)
  redirect_to request.referer || path
end

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password, :gender, :recieveReminders, :profilePicture, :passwordRecoverQuestion1, :passwordRecoverQuestion2, :passwordRecoverAnswer1, :passwordRecoverAnswer2, :isStudent, :aboutMe, :favoriteTutors, :classes, :price, :gender, :ratings, :reviews, :skills, :birthday) }
    end

end
