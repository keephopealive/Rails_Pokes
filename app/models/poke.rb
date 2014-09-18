class Poke < ActiveRecord::Base
	belongs_to :user
	belongs_to :poker, class_name: 'User', foreign_key: 'poke_id' # People who Poked us.
	# belongs_to :pokee, class_name: 'User', foreign_key: 'user_id' 
	# has_many :users

	# has_and_belongs_to_many :users

end