require "rails_helper"

RSpec.describe Post, type: :model do
	it "is an invalid post without a title" do
		post = Post.new(title: nil)
    	expect(post).to be_invalid
  	end 

  	it "is an invalid post without a description" do
  		post= Post.new(description: nil )
  		expect(post).to be_invalid
  	end

  	it "is an valid post with a title" do
		post = Post.new(title: "First Post Title", description: "First Post Description")
    	expect(post).to be_valid
  	end 

end

