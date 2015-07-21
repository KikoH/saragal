require 'file_size_validator' 
class Painting < ActiveRecord::Base
	belongs_to :user
	has_many :orders

	mount_uploader :image, ImageUploader

	validates :image,
	:presence => true,
	:file_size => {
		:maximum => 0.5.megabytes.to_i
	}

	def addedToCart(painting)
		return if painting.order_id.nil?
		order = orders.where(painting_id: painting.id).first
		order.painting_id == painting.id
	end
end
