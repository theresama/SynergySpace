
class RegistrationsController < Devise::RegistrationsController

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

 
  private
 
  def sign_up_params
    params.require(:user).permit(:name, :occupation, :email, :password, :password_confirmation, :avatar)
  end
 
  def account_update_params
    params.require(:user).permit(:name, :occupation, :email, :password, :password_confirmation, :current_password)
  end

  def update_sanitized_params
	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation, :avatar)}
	devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :avatar)}
  end

end