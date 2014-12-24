require 'rails_helper'

feature 'Create a new album' do

  # As a user,
  # I want to create an album of photos
  # So that I can show it off to my friends
  #
  # Acceptance Criteria:
  #
  # * [X] I can only create an album if I am signed in
  # * [X] I must enter a name and description
  # * [X] If all fields are complete, I am told that my album has been saved and
  #   I am redirected to the new album's page.
  # * [X] If a required field is incomplete, I am given an error message and stay
  #   on the create page
  # * [ ] If an album has the same name as one that is in the database, I get an error
  # message
  # * [ ] I can upload many photos to the album
  # * [X] The photo album is associated with my username

  context "User is not signed in" do
    scenario "user tries to create new album" do
      visit root_path
      click_on "New Album"

      expect(page).to have_content "You must be signed in to do that."
    end
  end

  context "User is signed in" do

    before(:each) do
      @existing_user = FactoryGirl.create(:user)

      visit root_path
      click_on "Sign In"

      fill_in "Email", with: @existing_user.email
      fill_in "Password", with: @existing_user.password
      click_on "Sign in"
    end

    scenario "user enters all required information correctly" do
      visit root_path
      click_on "New Album"

      fill_in "Album Name", with: "Vacation Pics"
      fill_in "Description", with: "These are pictures of my family on vacation!"
      click_on "Create Album"

      expect(page).to have_content "You've created a new album!"
      expect(page).to have_content "Vacation Pics"
      expect(page).to have_content "These are pictures of my family on vacation!"
      within('#user') do
        expect(page).to have_content @existing_user.username
      end
    end

    scenario "user does not enter all required information" do
      visit root_path
      click_on "New Album"

      click_on "Create Album"

      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Description can't be blank"
      expect(page).to have_content "Create a new album"
    end

    scenario "User enters an album name that is already in use" do
      existing_album = Album.create(name: "The first album", description: "This is my first album", user_id: 1)
      visit root_path
      click_on "New Album"

      fill_in "Album Name", with: "The first album"
      fill_in "Description", with: "This is my first album"

      click_on "Create Album"

      expect(page).to have_content "Name has already been taken"
      expect(page).to have_content "Create a new album"
    end
  end
end
