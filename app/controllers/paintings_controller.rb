class PaintingsController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

	load_and_authorize_resource
	def index
		@paintings = Painting.all
	end

	def show
		@painting = Painting.find(params[:id])
	end

	def new
		@painting = Painting.new
	end

	def create
		@painting = Painting.new(painting_params)
		@painting.user_id = current_user.id

		if @painting.save
			redirect_to paintings_path
		else
			render 'new'
		end
	end

	def edit
		@painting =  Painting.find(params[:id])
	end

	def update
		@painting =  Painting.find(params[:id])
		@painting.update_attributes(painting_params)
		redirect_to painting_path(@painting)
	end

	private
	def painting_params
		params.require(:painting).permit(:title, :description, :price, :user_id, :image, :order_id)
	end


end
