require 'spec_helper'
 
	RSpec.describe SessionsController do
 
		before do
	    	request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
	  	end
	 
	  	describe "#create" do
	 		it "should successfully create a user" do
	      		expect {
	        	post :create, provider: :facebook
	      		}.to change{ Ouser.count }.by(1)
	    	end
	 
	     	it "should successfully create a session" do
	       		expect(session[:ouser_id]).to be_nil
	       		post :create, provider: :facebook
	       		expect(session[:ouser_id]).not_to be_nil
	     	end
	     	

	   		describe "#destroy" do
	     		before do
	       			post :create, provider: :facebook
	     		end
	 
		    it "should clear the session" do
	       		session[:ouser_id].should_not be_nil
	       		delete :destroy
	       		session[:ouser_id].should be_nil
	     	end
	 
	    	it "should redirect to the home page" do
	       		delete :destroy
	       		response.should redirect_to login_path
	     	end

	   	end
	end
end
 
