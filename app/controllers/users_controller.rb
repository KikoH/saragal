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
			redirect_to(:users, notice: 'User was successfully created')
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
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to paintings_path
	end

	private
	def user_params
		params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :admin)
	end
end
