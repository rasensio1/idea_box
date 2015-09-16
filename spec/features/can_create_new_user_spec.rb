require 'rails_helper'

feature "can create a new user", js: true do
  scenario "with valid attributes" do

    expect(page).to have_content("Sign Up")
    visit new_user_path
    fill_in "user[username]", with: "Ryan"
    fill_in "user[password]", with: "password"

    click_on "Register"

    expect(current_path).to eq(user_path("for Ryan"))
  end
end
