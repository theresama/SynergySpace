class UsersController < ApplicationController

	before_filter :authenticate_user!

	def show
	  @user = User.find(params[:id])
	end

	def index
	  @users = User.all
	end

	def edit
	end

	def update
		@user = User.find(params[:id])
	end

	def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
      params.require(:user).permit(:name, :tag_list => []) ## Rails 4 strong params usage
    end

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end
