class AddOrderToPainting < ActiveRecord::Migration
  def change
  	add_column :paintings, :order_id, :integer, :default => nil
  end
end
