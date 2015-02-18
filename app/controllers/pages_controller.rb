class PagesController < ApplicationController

	def home
		if user_signed_in?
			if current_user.admin?
				redirect_to dashboard_path
			else
				redirect_to welcome_path
			end
			return
		end  
	end
end
