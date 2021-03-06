class UsersController < ApplicationController
	skip_before_filter :require_login, only: [:index, :new, :create]
	load_and_authorize_resource

	def index
		@users = User.all
	end
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to(root_path)
			auto_login(@user)
		else
			render 'new', :notice => "Error signing up"
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to paintings_paths
	end

	private
	def user_params
		params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :admin)
	end
end
