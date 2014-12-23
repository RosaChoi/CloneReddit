require "rails_helper"

feature "User Registration" do

  scenario "user signs up with valid credentials" do

    visit root_path
    click_on "signup-action"
    expect(page).to have_link("signup-action")

    fill_in "email-signup-field", with: "momo@gmail.com"
    fill_in "username-signup-field", with: "momo"
    fill_in "password-signup-field", with: "puppymomo"
    fill_in "password-conf-signup-field", with: "puppymomo"
    click_on "user-create-action"
    expect(page).to have_content("Signed in as momo")
  end

  scenario "User signs up with invalid credentials" do

    visit root_path
    click_on "signup-action"
    fill_in "Username", with: "momolove"
    click_on "user-create-action"

    expect(page).to have_content("2 errors prohibited this User from being saved")
  end

end
