require 'rails_helper'

feature "can login and logout users" do
  scenario "if just registered" do
    visit '/'

    click_link("Sign up")
    fill_in "user[username]", with: "Ryan"
    fill_in "user[password]", with: "password"
    click_on "Submit"

    expect(page).to have_content("This is the show page")

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sign up")

    click_on "Log In"
    fill_in "session[username]", with: "Ryan"
    fill_in "session[password]", with: "password"
    click_on "Submit"

    expect(page).to have_content("This is the show page")
  end
end
