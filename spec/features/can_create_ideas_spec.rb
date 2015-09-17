require 'rails_helper'

feature "user creates a new idea", js: true do
  scenario "with valid attributes" do
    skip

    expect(page).to have_content("This is the Idea Box!")
    visit new_idea_path
    fill_in "idea[title]", with: "Some idea..."
    fill_in "idea[body]", with: "This is the body"

    click_on "Create Idea"

    expect(current_path).to eq(idea_path)
  end
end
