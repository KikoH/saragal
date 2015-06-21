class CreatePhotos < ActiveRecord::Migration
	def change
		create_table :photos do |t|
			t.string	:title,		:null => false
			t.string	:description,	:null => false
			t.string 	:image

			t.timestamps null: false
		end
	end
end
