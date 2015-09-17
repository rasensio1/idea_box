require 'rails_helper'

feature "knows authorizations" do
  scenario "for an admin" do
    visit '/'

    click_link("Sign up")

    fill_in "user[username]", with: "Admin"
    fill_in "user[password]", with: "password"
    click_on "Submit"

    User.find_by(username: "Admin").update(role: 1)

    visit admin_categories_path

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("Categories")
  end

  scenario "for a peasant" do
    visit '/'

    click_link("Sign up")

    fill_in "user[username]", with: "Peasant"
    fill_in "user[password]", with: "password"

    click_on "Submit"

    visit admin_categories_path

    expect(page).to_not have_content("This is the show page")
    expect(page).to have_content("Sorry")
  end
end
