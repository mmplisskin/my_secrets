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
end