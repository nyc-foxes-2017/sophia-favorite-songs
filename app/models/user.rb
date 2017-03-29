class User < ApplicationRecord
	has_secure_password
	validates :username, :email, presence:true
	validates :password, length:{minimum:6}
end
