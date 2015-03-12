class UsersController < ApplicationController

	before_filter :authenticate_user!

	def create
	  @user = User.create( user_params )
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
	  		flash[:success] = "Profile updated"
	  		redirect_to @user
		else
	  		render 'edit'
	  	end
	end

	def show
	  @user = User.find(params[:id])
	end

	def index
	  @users = User.all
	end

	def edit
	end

	def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :skills, :interests, :occupation, :tag_list => [])
    end

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :skills, :interests, :occupation)
    end


end
