require "rails_helper"

RSpec.describe Post, type: :model do
	it "is invalid without a title" do
		post = Post.new(title: nil)
    	expect(post).to be_invalid
  	end 

end