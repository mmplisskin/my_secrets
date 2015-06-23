class OusersController < ApplicationController
  def imalive
 	@ouser = current_ouser
	@ouser.last_update = Time.now
	@ouser.save
	# redirect_to posts_path
  end
end
