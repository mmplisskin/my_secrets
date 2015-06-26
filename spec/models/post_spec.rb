require 'rails_helper'
	
RSpec.describe Post, type: :model do

    it "is an invalid post without a title" do
        post = Post.new(title: nil)
    	expect(post).to be_invalid
    end 
      
    it "is a valid post without a description" do
        post= Post.new(title: "test title", description: "test description")
        expect(post).to be_valid
    end	

    it "is an invalid post without a description" do
        post= Post.new(description: nil)
        expect(post).to be_invalid
    end

    it "is a valid post with a title" do
       post = Post.new(title: "First Post Title", description: "First Post Description")
       expect(post).to be_valid
    end 

    it "does not have a unique post title" do
       post = Post.create(title: "First post title", description: "First post description")
       post2 = Post.create(title: "First post title", description: "Second post description") 
       expect(post).to be_valid
       expect(post2).to be_invalid
	end

	it "is a unique post title" do
       post = Post.create(title: "First post title", description: "First post description")
       post2 = Post.create(title: "second post title", description: "Second post description") 
       expect(post2).to be_valid
    end
	
	it "is an invalid post without a minimum title length of 8 characters" do
        post= Post.new(title: "123", description: "test description")
        expect(post).to be_invalid
    end

    it "is a valid post with a minimum title length of 8 characters" do
        post= Post.new(title: "12345678", description: "test description")
        expect(post).to be_valid
    end

    it "is an invalid post without a minimum description length of 15 characters" do
        post= Post.new(title: "123", description: "test description")
        expect(post).to be_invalid
    end

    it "is a valid post with a minimum description length of 15 characters" do
        post= Post.new(title: "12345678", description: "test description")
        expect(post).to be_valid
    end	      
end

