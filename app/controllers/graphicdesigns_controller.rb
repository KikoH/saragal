class GraphicdesignsController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

	load_and_authorize_resource
	def index
		@graphicdesigns = Graphicdesign.all
	end

	def show
		@graphicdesign = Graphicdesign.find(params[:id])
	end

	def new
		@graphicdesign = Graphicdesign.new
	end

	def create
		@graphicdesign = Graphicdesign.new(graphicdesign_params)
		@graphicdesign.user_id = current_user.id

		if @graphicdesign.save
			redirect_to graphicdesigns_path
		else
			render 'new'
		end
	end

	def edit
		@graphicdesign =  Graphicdesign.find(params[:id])
	end

	def update
		@graphicdesign =  Graphicdesign.find(params[:id])
		@graphicdesign.update_attributes(graphicdesign_params)
		redirect_to graphicdesign_path(@graphicdesign)
	end

	private
	def graphicdesign_params
		params.require(:graphicdesign).permit(:title, :description, :user_id, :image)
	end
end
