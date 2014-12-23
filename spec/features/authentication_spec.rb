require "rails_helper"

feature "User Authentication" do

  scenario "user signs in with valid credentials" do

    User.create!(
      email:"momo@gmail.com",
      username: "momo",
      password: "pupmomo",
      password_confirmation: "pupmomo"
    )

    visit root_path
    click_on "signin-action"
    expect(page).to have_link("signin-action")

    fill_in "email-field", with: "momo@gmail.com"
    fill_in "password-field", with: "pupmomo"
    click_on "user-login-action"
    expect(page).to have_content("Successfully signed in")
  end

  scenario "user signs in with invalid credentials" do

    User.create!(
    email:"momo@gmail.com",
    username: "momo",
    password: "pupmomo",
    password_confirmation: "pupmomo"
    )

    visit root_path
    click_on "signin-action"
    expect(page).to have_link("signin-action")

    fill_in "email-field", with: "momo@gmail.com"
    fill_in "password-field", with: "puppymomo"
    click_on "user-login-action"
    expect(page).to have_content("Username / password combination is invalid")
  end

  scenario "user logs out" do

    User.create!(
    email:"momo@gmail.com",
    username: "momo",
    password: "pupmomo",
    password_confirmation: "pupmomo"
    )

    visit root_path
    click_on "signin-action"
    expect(page).to have_link("signin-action")

    fill_in "email-field", with: "momo@gmail.com"
    fill_in "password-field", with: "pupmomo"
    click_on "user-login-action"
    click_on "signout-action"

    expect(page).to have_content("You have been signed out")
  end

end
