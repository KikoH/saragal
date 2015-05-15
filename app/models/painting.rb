class Painting < ActiveRecord::Base
	belongs_to :user
	has_many :orders

	mount_uploader :image, ImageUploader
end
