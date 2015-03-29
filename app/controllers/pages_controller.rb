class PagesController < ApplicationController

	def listings
		if params[:city]
			@spaces = Space.where(city: params[:city])
		else
			@spaces = Space.all
		end
	end

	def home
		@spaces = Space.all
		if user_signed_in?
			if current_user.admin?
				redirect_to dashboard_path
			else
				redirect_to listings_path
			end
			return
		end  
	end
end
