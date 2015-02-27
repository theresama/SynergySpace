class User < ActiveRecord::Base
	has_many :spaces, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    ratyrate_rateable "reputation"
    ratyrate_rater

    acts_as_taggable # Alias for acts_as_taggable_on :tags
    acts_as_taggable_on :skills, :interests

    protected
	    def configure_permitted_parameters
	      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :name, :occupation, :skills, :interests) }
	      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :name, :occupation, :skills, :interests) }
	      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :name, :occupation, :skills, :interests) }
	    end
         
end
