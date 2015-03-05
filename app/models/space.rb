class Space < ActiveRecord::Base

	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], :default_url => "/images/:style/missing.png"
	belongs_to :user
	has_many :leases
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :name, presence: true, length: { maximum: 100 }
	validates :spacetype, presence: true
	validates :streetnum, presence: true
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :price, presence: true
	validates :vacancies, presence: true
	validates :areacode, presence: true

  	ratyrate_rateable "reputation"
end
