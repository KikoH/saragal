class DesignsController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

	load_and_authorize_resource
	def index
		@design = Design.all
	end

	def show
		@overflow = true
		@design = Design.find(params[:id])
	end

	def new
		@design = Design.new
	end

	def create
		@design = Design.new(design_params)
		@design.user_id = current_user.id

		if @design.save
			redirect_to designs_path
		else
			render 'new'
		end
	end

	def edit
		@design =  Design.find(params[:id])
	end

	def update
		@design =  Design.find(params[:id])
		@design.update_attributes(design_params)
		redirect_to hoto_path(@design)
	end

	def method_name
		@design = Design.find(params[:id])
		@design.destroy
		redirect_to designs_path
	end

	private
	def design_params
		params.require(:design).permit(:title, :description, :user_id, :image)
	end
end
