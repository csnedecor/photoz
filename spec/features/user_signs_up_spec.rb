require 'rails_helper'

feature "Create a new album" do
  # As a user,
  # I want to sign up for the application
  # So that I can use all of the features
  #
  # Acceptance Criteria:
  #
  # * [X] There is a link to 'Sign Up' on the homepage
  # * [X] If I fill in my email, password, and password confirmation correctly,
  #   I'm greeted with a message that my account has been created
  # * [X] If the password and password confirmation fields do not match, I'm given
  #   an error message
  # * [ ] If my email already exists in the database, I am given a message that I
  #   have an account already
  # * [ ] If my email is not formatted correctly, I am given an error message

  scenario "gives the user a happy message when user signs up with good information" do
    visit root_path
    click_on "Sign Up"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "passwords do not match when" do
    visit root_path
    click_on "Sign Up"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "notmypassword"
    click_on "Sign up"

    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario "email is already registered" do
    existing_user = User.create(
    email: "test@example.com",
    password: "password"
    )

    visit root_path
    click_on "Sign Up"

    fill_in "Email", with: existing_user.email
    fill_in "Password", with: existing_user.password
    fill_in "Password confirmation", with: existing_user.password
    click_on "Sign up"

    expect(page).to have_content("Email has already been taken")
  end
end
