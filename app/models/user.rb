class User < ActiveRecord::Base
	has_many :posts
	# has_secure_password
	has_many :recipients
end
