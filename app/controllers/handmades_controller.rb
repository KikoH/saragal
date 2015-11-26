class HandmadesController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

	load_and_authorize_resource

	def index
		@handmades = Handmade.all
	end

	def show
		@overflow = true
		@handmade = Handmade.find(params[:id])
	end

	def new
		@handmade = Handmade.new
	end

	def create
		@handmade = Handmade.new(handmade_params)
		@handmade.user_id = current_user.id
		if @handmade.save
			redirect_to handmade_path(@handmade)
		else
			render 'new'
		end
	end

	def edit
		@handmade =  Handmade.find(params[:id])
	end

	def update
		@handmade =  Handmade.find(params[:id])
		@handmade.update_attributes(handmade_params)
		redirect_to handmade_path(@handmade)
	end

	def destroy
		@handmade = Handmade.find(params[:id])
		@handmade.destroy
		redirect_to handmades_path
	end

	private
	def handmade_params
		params.require(:handmade).permit(:title, :description, :price, :user_id, :image)
	end
end
