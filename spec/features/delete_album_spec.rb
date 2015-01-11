require "rails_helper"

feature "User deletes album" do
  # As a user,
  # I want to delete my album
  # So I can keep my collection up to date
  #
  # Acceptance Criteria:
  # [X] When I visit my album page, I see a button to delete the album
  # [X] If I am not logged in, I cannot delete albums
  # [X] I cannot delete anyone's album but my own
  # [X] When I delete my album, I also delete all the photos in it
  # [X] When I delete my album, I get a success message and am redirected to
  #    my profile

  context "User is logged in" do

    before(:each) do
      @existing_user = FactoryGirl.create(:user)

      visit root_path
      click_on "Sign In"

      fill_in "Email", with: @existing_user.email
      fill_in "Password", with: @existing_user.password
      click_on "Sign in"
    end

    scenario "User successfully deletes an album" do
      album = FactoryGirl.create(:album, user: @existing_user)

      visit album_path(album)
      click_on "Delete Album"

      expect(page).to have_content "Successfully deleted #{album.name}"
      expect(page).to have_content "Profile"
    end

    scenario "User tries to delete another user's album" do
      album = FactoryGirl.create(:album)

      visit album_path(album)

      expect(page).not_to have_content "Delete Album"
    end
  end

  context "Visitor is not logged in" do
    scenario "Visitor tries to delete an album" do
      album = FactoryGirl.create(:album)

      visit album_path(album)

      expect(page).not_to have_content "Delete Album"
    end
  end
end
