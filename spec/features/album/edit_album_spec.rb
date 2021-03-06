require "rails_helper"

feature "Edit album" do
  # As a user,
  # I want to be able to edit my albums
  # So I can keep them up to date
  #
  # Acceptance Criteria:
  # [X] If I'm not logged in, I can't see the option to edit my album when I am
  #    on my album's page
  # [X] If I am logged in, I can see the option to edit each of my albums
  #    when I view the list of my albums in my user profile
  # [X] I can only edit my album when I am logged in.
  # [X] I can only edit my own albums
  # [X] I can add photos to my album
  # [X] I can remove photos from my album
  # [X] I can edit the name and description of my album
  # [X] If I enter valid information, I am taken to that album
  #    and am given a success message
  # [X] If I submit without at least one photo, a name and a description, I get
  #    an error message.
  # [X] If the name has already been taken, I get an error message
  # [X] The edit page has the photos, name and description of the album
  #    already filled in.

  context "User is logged in and has created an album" do
    before(:each) do
      @existing_user = create(:user)
      @existing_album = create(:album, user: @existing_user)

      sign_in(@existing_user)
    end

    scenario "User inputs valid information" do
      visit album_path(@existing_album)
      click_on "Edit album"

      fill_in "Name", with: "New name"
      fill_in "Description", with: "New description"
      attach_file('album_photos_attributes_2_photo', Rails.root + 'spec/fixtures/agriculture.jpg')
      check 'album[photos_attributes][7][_destroy]'

      click_on "Save Album"

      expect(page).to have_content "New name"
      expect(page).to have_content "New description"
      within('#photo0') do
        expect(find("img")["src"]).not_to have_content "Airturbine.jpg"
      end
      within('#photo1') do
        expect(find("img")["src"]).to have_content "agriculture.jpg"
      end
      expect(@existing_album.photos.count).to eq(2)
      expect(page).to have_content "Successfully updated album!"
    end

    scenario "User visits edit page" do
      visit edit_album_path(@existing_album)

      expect(page).to have_selector("input[value='#{@existing_album.name}']")
      expect(page).to have_content @existing_album.description
      expect(first("img")["src"]).to have_content "Airturbine.jpg"
    end

    scenario "User enters blank fields" do
      visit edit_album_path(@existing_album)

      fill_in "Name", with: ""
      fill_in "Description", with: ""
      check "album[photos_attributes][7][_destroy]"
      check "album[photos_attributes][8][_destroy]"

      click_on "Save Album"

      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Description can't be blank"
      expect(page).to have_content "You must attach at least one photo"
    end

    scenario "User enters a name that has already been taken" do
      other_existing_album = create(:album, user: @existing_user)
      visit edit_album_path(@existing_album)

      fill_in "Name", with: other_existing_album.name

      click_on "Save Album"

      expect(page).to have_content "Name has already been taken"
    end

    scenario "User tries to edit another user's album" do
      other_album = create(:album)

      visit album_path(other_album)

      expect(page).not_to have_content "Edit album"
    end

    scenario "User edits album from their profile page" do
      other_album = create(:album)

      visit user_path(@existing_user)

      expect(page).not_to have_content other_album.name
      expect(page).to have_content @existing_album.name

      click_on "Edit album"

      expect(page).to have_content "Edit your album"
    end
  end

  context "Visitor is not signed in" do
    scenario "Visitor tries to edit an album" do
      album = create(:album)

      visit album_path(album)

      expect(page).not_to have_content "Edit album"

      visit user_path(album.user)

      expect(page).not_to have_content "Edit album"

      visit edit_album_path(album)

      expect(page).to have_content "You must be signed in to do that"
    end
  end
end
