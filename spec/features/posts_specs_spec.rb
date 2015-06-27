require 'rails_helper'

RSpec.feature "PostsSpecs", type: :feature do
	feature "a user can create a new post" do
		scenario "valid post" do
			visit 'posts/new'
			fill_in "The Secret", with: "My new secret"
			fill_in "Secret Details", with: "I have tons of secrets"
			click_button "Save Secret"
			expect(page).to have_content("Secrets")
		end
	end
end
