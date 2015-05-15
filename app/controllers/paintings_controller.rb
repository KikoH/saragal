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

		if @painting.save
			redirect_to paintings_path
		else
			render 'new'
		end
	end

	private
	def painting_params
		params.require(:painting).permit(:title, :description, :price, :user_id, :image, :order_id)
	end


end
