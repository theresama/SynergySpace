class PagesController < ApplicationController

	def listings
		if params[:city] && params[:min_price] && params[:max_price]
			@spaces = Space.where(city: params[:city])
			start_price = params[:min_price]
			end_price = params[:max_price]
			@spaces = @spaces.where("price between (?) and (?)", start_price, end_price)
		else
			@spaces = Space.where("vacancies > ?", 0)
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
