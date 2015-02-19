class AdminController < ApplicationController
	before_filter :authenticate_user!

	def dashboard
		if not current_user.admin?
			redirect_to welcome_path
		end
	end

	def indexUsers

	end

	def makeAdmin
		user.update_attribute :admin, true

		render :json =>  { :status => :ok }
	end


end
