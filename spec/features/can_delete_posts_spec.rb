require 'rails_helper'

feature "delete ideas" do
  scenario "as a user" do
    visit '/'

    click_link("Sign up")
    fill_in "user[username]", with: "Ryan"
    fill_in "user[password]", with: "password"
    click_on "Submit"

    click_link("New Idea")

    fill_in "idea[title]", with: "My first idea"
    fill_in "idea[body]", with: "Its a good one"
    click_on "Submit"

    expect(page).to have_content("My first idea")

    click_link("Delete")

    expect(page).to_not have_content("My first idea")
  end
end
