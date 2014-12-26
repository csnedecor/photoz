require 'rails_helper'

feature 'user sign out' do
  # As a user
  # I want to sign out
  # So other people who use my computer can't sabotage my albums
  #
  # * [X] There is a link to 'Sign out' in the header when I am signed in
  # * [X] If I am successfully signed out, I receive a success message

  context "User is signed in" do

    before(:each) do
      @existing_user = FactoryGirl.create(:user)

      visit root_path
      click_on "Sign In"

      fill_in "Email", with: @existing_user.email
      fill_in "Password", with: @existing_user.password
      click_on "Sign in"
    end

    scenario 'user signs out' do
      visit root_path
      click_on "Sign Out"

      expect(page).to have_content "Signed out successfully."
      expect(page).not_to have_content @existing_user.username
    end
  end
end
