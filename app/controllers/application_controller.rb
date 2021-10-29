class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

	#before_action :update_allowed_parameters, if: :devise_controller?
	
	before_action :authenticate_user!

	# after_action :verify_authorized, :except => :index, unless: :devise_controller?

	include Pundit
	
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	def user_not_authorized
		flash[:alert] = "You are not authorized to perform this action."
		redirect_to(request.referrer || root_path)
	end
	
	# protected

	# def update_allowed_parameters
	#  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :first_name, :last_name, :email, :phone_no, :password)}
	# 	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :first_name, :last_name, :email, :phone_no, :password, :current_password)}
	# end


#   skip_after_action :verify_authorized


#include Pundit
# rescue_from Pundit::NotAuthorizedError, with: :not_authorized

# private

# def not_authorized
#     flash[:alert] ="Access denied."
#     redirect_back fallback_location: root_path
# end
    
end
