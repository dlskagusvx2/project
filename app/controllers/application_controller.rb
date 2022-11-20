class ApplicationController < ActionController::Base
	before_action :authenticate_student!
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	protected
	
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:s_name,:grade,:s_num,:department_id])	
	end
end
