class OusersController < ApplicationController
  def imalive
 	@ouser = current_ouser
	@ouser.last_update = Time.now
	@ouser.save
	redirect_to root_path
  end
end
