class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
	
	before_action :authenticate_user!

	

	after_action :verify_authorized, :except => :index, unless: :devise_controller?

	include Pundit
	
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	def user_not_authorized
		flash[:alert] = "You are not authorized to perform this action."
		redirect_to(request.referrer || root_path)
	end

	
end
