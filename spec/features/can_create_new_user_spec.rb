require 'rails_helper'

feature "can create a new user" do
  scenario "with valid attributes" do
    visit '/'

    click_link("Sign up")

    fill_in "user[username]", with: "Ryan"
    fill_in "user[password]", with: "password"

    click_on "Submit"

    expect(page).to have_content("Ryan")
  end
end
