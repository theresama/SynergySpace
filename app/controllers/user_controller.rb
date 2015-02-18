class UsersController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_user_type

	def index
	  @users = @User.all
	end


end
