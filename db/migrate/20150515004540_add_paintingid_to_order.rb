class AddPaintingidToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :painting_id, :integer, :default => nil
  end
end
