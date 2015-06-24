class Ouser < ActiveRecord::Base
	has_many :posts
	has_many :recipients
	# 
	# attr_accessor :latitude, :longitude,

	class << self
	  def from_omniauth(auth_hash)
	    ouser = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	    ouser.name = auth_hash['info']['name']
	    ouser.location = auth_hash['info']['location']
	    ouser.image_url = auth_hash['info']['image']
	    ouser.url = auth_hash['info']['urls'][ouser.provider.capitalize]
	    ouser.email= auth_hash['info']['email']
	    ouser.save!
	    ouser
	  end
	end
end
