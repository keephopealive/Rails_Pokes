class User < ActiveRecord::Base
	has_many :pokes
	has_many :poked, through: :pokes, foreign_key: "user_id" # People who we poked.

	validates :name, 			:presence 	=> true,
			  :length 						=> { :within => 2..40 }

	validates :alias, 			:presence 	=> true,
			  :length 						=> { :within => 2..40 }

	validates :email, 			:presence 	=> true,
			  :length 						=> { :within => 2..40 }

	validates :birthdate, 			:presence 	=> true,
			  :length 						=> { :within => 2..40 }

	attr_accessor :password
	validates :password, 		:presence 	=> true,
			  :length						=> { :within => 6..50 }

	before_save :encrypt_password

	private def encrypt_password
		self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}}") if self.new_record?
		self.encrypted_password = encrypt(password)
	end

	def encrypt(pass)
		Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
	end


	def self.authenticate(email, submitted_password)
		user = User.find_by(email: email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end
end
