require 'rails_helper'

feature "create ideas" do
  scenario "with valid input and a category" do
    visit '/'

    click_link("Sign up")
    fill_in "user[username]", with: "Admin"
    fill_in "user[password]", with: "password"
    click_on "Submit"

    User.find_by(username: "Admin").update(role: 1)
    visit admin_categories_path

    click_link("New Category")
    fill_in "category[name]", with: "Life"
    click_on "Submit"
    click_link("New Category")
    fill_in "category[name]", with: "Money"
    click_on "Submit"
    click_link("New Category")
    fill_in "category[name]", with: "Food"
    click_on "Submit"

    click_link("Logout")

    click_link("Sign up")
    fill_in "user[username]", with: "Ryan"
    fill_in "user[password]", with: "password"
    click_on "Submit"

    click_link("New Idea")
    save_and_open_page
    fill_in "idea[title]", with: "My first idea"
    fill_in "idea[body]", with: "Its a good one"
    click_on "categories"
    click_on "Life"
    click_on "Submit"

    expect(page).to have_content("My first idea")
    expect(page).to have_content("Life")
  end
end
