class CreateGraphicdesigns < ActiveRecord::Migration
	def change
		create_table :graphicdesigns do |t|
			t.string	:title,		:null => false
			t.string	:description,	:null => false
			t.string 	:image
			t.integer	:user_id

			t.timestamps null: false
		end
	end
end
