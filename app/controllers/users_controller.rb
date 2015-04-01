class UsersController < ApplicationController

	before_filter :authenticate_user!

	def new
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
		  if @user.update_attributes(user_params)
		  	sign_in(@user, :bypass => true)
		    format.html { redirect_to @user, notice: 'User was successfully updated.' }
		    format.json { render :show, status: :ok, location: @user }
		  else
		    format.html { render :edit }
		    format.json { render json: @user.errors, status: :unprocessable_entity }
		  end
		end
	end

	def show
	  @user = User.find(params[:id])
	  @leases = Lease.where(user: params[:id], accepted: true)
	  @owns = Space.where(user: params[:id])
	  network = Lease.where(user: params[:id], accepted: true) | Lease.where(space: @owns)
	  ary = Array.new
	  all_spaces = Array.new
	  network.each do |social|
	  	ary.push(social.user)
	  end
	  @leases.each do |s|
	  	curr = Lease.where(space: s.space, accepted: true)
	  	curr.each do |c|
	  		ary.push(c.user)
	  	end
	  end
	  ary.delete(@user)
	  @social = ary.uniq
	end

	def index
	  @users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_space
	    @user = User.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def user_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation, :occupation, :current_password )
	  end

end
