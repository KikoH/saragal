class CreateDesigns < ActiveRecord::Migration
	def change
		create_table :designs do |t|
			t.string	:title,		:null => false
			t.string	:description,	:null => false
			t.string 	:image
			t.integer	:user_id

			t.timestamps null: false
		end
	end
end
