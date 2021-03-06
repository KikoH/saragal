require 'file_size_validator' 

class Handmade < ActiveRecord::Base
	belongs_to :user

	mount_uploader :image, ImageUploader

	validates :image,
	:presence => true,
	:file_size => {
		:maximum => 0.5.megabytes.to_i
	}
end
