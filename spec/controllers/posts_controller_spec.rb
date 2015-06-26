require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
	before :each do
    @post1 = Post.create(title:"facebook", description: "please destroy my account")
    @post2 = Post.create(title:"myspace", description:"i don't really care")
  end
  let(:valid_attributes) do
    {
    :title => "facebook",
    :description => "please destroy my account"
    }
  end

    let(:invalid_attributes) do
    {
    :title => "",
    :description => "i don't really care"
    }
  end

  describe "GET new" do
  	it "assigns a new post as @post"do
  		get :new
  		expect(assigns(:post)).to be_a_new(Post)
  	end

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new post" do
        expect {
          post :create, {:post => valid_attributes}
        }.to change(post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => valid_attributes}
        expect(assigns(:post)).to be_a(post)
        #expect(assigns(:post)).to be_persisted
      end

      # it "redirects to the created post" do
      #   post :create, {:post => valid_attributes}
      #   expect(response).to redirect_to(post.last)
      # end
    end

    # describe "with invalid params" do
    #   it "assigns a newly created but unsaved post as @post" do
    #     post :create, {:post => invalid_attributes}
    #     expect(assigns(:post)).to be_a_new(post)
    #   end

    #   it "re-renders the 'new' template" do
    #     post :create, {:post => invalid_attributes}
    #     expect(response).to render_template("new")
    #   end
    # end
  end


end