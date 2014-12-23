require 'rails_helper'

feature "User signs up" do

  # As a user,
  # I want to sign up for the application
  # So that I can use all of the features
  #
  # Acceptance Criteria:
  #
  # * [X] There is a link to 'Sign Up' in the header
  # * [X] I must include an email, password, and username
  # * [X] If I fill in my username, email, password, and password confirmation correctly,
  #   I'm greeted with a message that my account has been created
  # * [X] If the password and password confirmation fields do not match, I'm given
  #   an error message
  # * [X] If my email already exists in the database, I am given a message that I
  #   have an account already
  # * [X] If my email is not formatted correctly, I am given an error message
  # * [X] If my username already exists in the database, I am given a message that tells
  #   me to pick another one or sign in
  # * [ ] I can sign up using GitHub

  scenario "gives the user a happy message when user signs up with good information" do
    visit root_path
    click_on "Sign Up"
    fill_in "Username", with: "JSmith"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).not_to have_content "Sign Up"
    expect(page).to have_content "Sign Out"
  end

  scenario "passwords do not match when" do
    visit root_path
    click_on "Sign Up"

    fill_in "Username", with: "JSmith"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "notmypassword"
    click_on "Sign up"

    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario "email and username are already taken" do
    existing_user = User.create(
    username: "TweedleDee",
    email: "test@example.com",
    password: "password"
    )

    visit root_path
    click_on "Sign Up"

    fill_in "Username", with: existing_user.username
    fill_in "Email", with: existing_user.email
    fill_in "Password", with: existing_user.password
    fill_in "Password confirmation", with: existing_user.password
    click_on "Sign up"

    expect(page).to have_content "Email has already been taken"
    expect(page).to have_content "Username has already been taken"
  end

  scenario "email is improperly formatted" do
    visit root_path
    click_on "Sign Up"

    fill_in "Username", with: "JSmith"
    fill_in "Email", with: "notanemailaddress"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "notmypassword"
    click_on "Sign up"

    expect(page).to have_content "Email is invalid"
  end

  scenario "required fields are not filled in" do
    visit root_path
    click_on "Sign Up"

    click_on "Sign up"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Password can't be blank"
  end
end
