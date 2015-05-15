class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer :user_id
    	t.integer :order_num

      t.timestamps null: false
    end
  end
end
