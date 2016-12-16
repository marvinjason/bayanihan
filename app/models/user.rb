class User < ApplicationRecord

	serialize :access_token
	has_many :tweets
	has_many :posts

	class << self
		def from_omniauth(auth_hash)
			user = find_or_create_by(uid: auth_hash['uid'])
			user.name = auth_hash['info']['name']
		    user.location = auth_hash['info']['location']
		    user.image_url = auth_hash['info']['image']
		    user.url = auth_hash['info']['urls']['Twitter']

		    #user.access_token = auth_hash['extra']['access_token']

		    user.save!
		    user
		end
	end

end
