class User < ActiveRecord::Base
	has_many :spaces

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    ratyrate_rateable "reputation"
    ratyrate_rater

         
end
