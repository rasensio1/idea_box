
require 'rails_helper'

feature "delete categories" do
  scenario "as admin" do
    visit '/'

    click_link("Sign up")
    fill_in "user[username]", with: "Admin"
    fill_in "user[password]", with: "password"
    click_on "Submit"

    User.find_by(username: "Admin").update(role: 1)

    visit admin_categories_path


    expect(page).to have_content("New Category")

    click_link("New Category")

    fill_in "category[name]", with: "Some category"
    click_on "Submit"

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("Some category")

    click_on "Delete"
    expect(current_path).to eq(admin_categories_path)
    expect(page).to_not have_content("Some category")

  end
end
