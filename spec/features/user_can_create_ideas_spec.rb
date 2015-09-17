require 'rails_helper'

feature "create ideas" do
  scenario "with valid input" do
    visit '/'

    click_link("Sign up")
    fill_in "user[username]", with: "Ryan"
    fill_in "user[password]", with: "password"
    click_on "Submit"

    expect(page).to have_content("New Idea")

    click_link("New Idea")

    fill_in "idea[title]", with: "My first idea"
    fill_in "idea[body]", with: "Its a good one"
    click_on "Submit"

    expect(current_path).to eq(user_path(5))
    expect(page).to have_content("My first idea")
  end
end
