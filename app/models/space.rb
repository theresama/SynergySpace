class Space < ActiveRecord::Base
	belongs_to :user
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
