class User < ActiveRecord::Base
	authenticates_with_sorcery!

	validates :password, length: { minimum: 3 }
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :email, uniqueness: true

	has_many :paintings
	has_many :orders

	def full_name
		first_name + " " + last_name
	end

	def pretty_created_at
		created_at.strftime("%b %d, %Y")
	end
end
