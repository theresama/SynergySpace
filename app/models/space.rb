class Space < ActiveRecord::Base
  	validates :name, presence: true, length: { maximum: 100 }
  	validates :type, presence: true
  	validates :streetnum, presence: true
  	validates :street, presence: true
  	validates :city, presence: true
  	validates :state, presence: true
  	validates :areacode, presence: true
end
