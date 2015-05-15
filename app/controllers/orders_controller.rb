class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		@painting = @order.painting
		if @order.save
			redirect_to painting_path(@painting) 
		else
			redirect_to painting_path(@painting) 
		end
	end

	private
	def order_params
		params.require(:order).permit(:user_id, :painting_id)
	end
end
