class PagesController < ApplicationController

	def welcome
	  @spaces = Space.all
	end

	def home
		@spaces = Space.all
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
