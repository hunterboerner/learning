class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#I was going to put an insane regex here from the internetz but it seemed to take more effort than I wanted to put in now
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
