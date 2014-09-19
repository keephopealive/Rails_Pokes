class Poke < ActiveRecord::Base
	belongs_to :user
	belongs_to :poked, class_name: 'User', foreign_key: 'poke_id' # People who WE POKED.
end