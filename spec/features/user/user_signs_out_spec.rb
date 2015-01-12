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
      sign_in(@existing_user)
    end

    scenario 'user signs out' do
      visit root_path
      click_on "Sign Out"

      expect(page).to have_content "Signed out successfully."
      expect(page).not_to have_content @existing_user.username
    end
  end
end
