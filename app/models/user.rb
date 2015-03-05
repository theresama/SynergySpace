class User < ActiveRecord::Base
	has_many :spaces, dependent: :destroy
  has_many :leases, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



    validates :name, presence: true


    ratyrate_rateable "reputation"
    ratyrate_rater

    acts_as_taggable # Alias for acts_as_taggable_on :tags
    acts_as_taggable_on :skills, :interests

    has_attached_file :avatar
    validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], :default_url => "/images/:style/missing.png"
    
    protected
	    def configure_permitted_parameters
	      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :name, :occupation, :skills, :interests, :avatar) }
	      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :name, :occupation, :skills, :interests, :avatar) }
	      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :name, :occupation, :skills, :interests, :avatar) }
	    end
         
end
