class CreateHandmades < ActiveRecord::Migration
  def change
    create_table :handmades do |t|
    	t.string	:title,		:null => false
    	t.string	:description,	:null => false
    	t.integer	:price,		:null => false
    	t.integer	:user_id
    	t.string	:image
    	
      t.timestamps null: false
    end
  end
end
