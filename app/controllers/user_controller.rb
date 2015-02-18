class UsersController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_user_type

	def index
	  @users = @User.all
	end

	def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end


end
