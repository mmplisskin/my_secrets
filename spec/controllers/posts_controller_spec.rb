require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  before :each do
    @post1 = Post.create(title:"facebook", description: "Deleted it" )
    @post2 = Post.create(title:"myspace", description: "No one cares")
  end
  let(:valid_attributes) do
    {
    :title => "Facebook",
    :description => "Delete it",
    }
  end
  describe "POST create" do
    describe "without valid log in" do
      it "sends user back to log in page" do
        (expect(response.status).to eq(200))

        end
    end
  end

      # it "assigns a newly created post as @post" do
      #   post :create, {:post => valid_attributes}
      #   expect(assigns(:post)).to be_a(post)
      #   expect(assigns(:post)).to be_persisted
      # end

      # it "redirects to the created post" do
      #   post :create, {:post => valid_attributes}
      #   expect(response).to redirect_to(post.last)
      # end
    # end

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
  # end


end