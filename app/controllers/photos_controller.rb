class PhotosController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

	load_and_authorize_resource
	def index
		@photo = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.user_id = current_user.id

		if @photo.save
			redirect_to photos_path
		else
			render 'new'
		end
	end

	def edit
		@photo =  Photo.find(params[:id])
	end

	def update
		@photo =  Photo.find(params[:id])
		@photo.update_attributes(photo_params)
		redirect_to hoto_path(@photo)
	end

	private
	def photo_params
		params.require(:photo).permit(:title, :description, :user_id, :image)
	end
end
