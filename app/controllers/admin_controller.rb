class AdminController < ApplicationController
	before_filter :authenticate_user!

	def dashboard
		if not current_user.admin?
			redirect_to listings_path
		end

		@openNum = Space.where("spacetype = 'Open Concept'").count()
		@cubicleNum = Space.where("spacetype = 'Cubicles'").count()
		@teamNum = Space.where("spacetype = 'Team'").count()
		@combinationNum = Space.where("spacetype = 'Combination'").count()
	end

	def indexUsers

	end

	def indexSpaces

	end

	def makeAdmin
		@id = params[:id]
		@adminStatus = params[:adminStatus]

		user = User.find(@id)
		user.update(:admin => @adminStatus)
		#user.update_attribute :admin, true

		render :json =>  { :status => :ok }
	end


end
