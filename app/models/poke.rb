class Poke < ActiveRecord::Base
	belongs_to :user
	belongs_to :poked, class_name: 'User', foreign_key: 'poke_id' # People who WE POKED.
	belongs_to :pokee, class_name: 'User', foreign_key: 'user_id' # People who POKED US.
end