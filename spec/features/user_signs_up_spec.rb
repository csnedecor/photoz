require 'rails_helper'

feature "Create a new album" do
  # As a user,
  # I want to sign up for the application
  # So that I can use all of the features
  #
  # Acceptance Criteria:
  #
  # * [ ] There is a link to 'Sign Up' on the homepage
  # * [ ] If I fill in my email, password, and password confirmation correctly,
  #   I'm greeted with a message that my account has been created
  # * [ ] If the password and password confirmation fields do not match, I'm given
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
end
