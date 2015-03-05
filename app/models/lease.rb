class Lease < ActiveRecord::Base
	belongs_to :user
	belongs_to :space

	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :space, presence: true
	validates :startdate, presence: true
	validates :enddate, presence: true
	validates :message, presence: true
end
