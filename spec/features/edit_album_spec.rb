require "rails_helper"

feature "Edit album" do
  # As a user,
  # I want to be able to edit my albums
  # So I can keep them up to date
  #
  # Acceptance Criteria:
  # [] If I am logged in, I can see the option to edit my album when I am
  #    on my album's page
  # [] If I am logged in, I can see the option to edit each of my albums
  #    when I view the list of my albums in my user profile
  # [] I can only edit my own albums
  # [X] I can add photos to my album
  # [X] I can remove photos from my album
  # [X] I can edit the name and description of my album
  # [X] If I enter valid information, I am taken to that album
  #    and am given a success message
  # [X] If I submit without at least one photo, a name and a description, I get
  #    an error message.
  # [] If the name has already been taken, I get an error message
  # [X] The edit page has the photos, name and description of the album
  #    already filled in.

  context "User is logged in and has created an album" do
    before(:each) do
      @existing_user = FactoryGirl.create(:user)
      @existing_album = FactoryGirl.create(:album, user: @existing_user)

      visit root_path
      click_on "Sign In"

      fill_in "Email", with: @existing_user.email
      fill_in "Password", with: @existing_user.password
      click_on "Sign in"

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
        expect(find('img')['src']).not_to have_content "Airturbine.jpg"
      end
      within('#photo0') do
        expect(find('img')['src']).to have_content "agriculture.jpg"
      end
      expect(@existing_album.photos.count).to eq(2)
      expect(page).to have_content "Successfully updated album!"
    end

    scenario "User visits edit page" do
      visit edit_album_path(@existing_album)

      expect(page).to have_selector("input[value='#{@existing_album.name}']")
      expect(page).to have_content @existing_album.description
      expect(first('img')['src']).to have_content "ice-boats.jpg"
    end

    scenario "User enters blank fields" do
      visit edit_album_path(@existing_album)

      fill_in "Name", with: ""
      fill_in "Description", with: ""
      check 'album[photos_attributes][7][_destroy]'
      check 'album[photos_attributes][8][_destroy]'

      click_on "Save Album"

      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Description can't be blank"
      expect(page).to have_content "You must attach at least one photo"
    end

    scenario "User enters a name that has already been taken" do
      @other_existing_album = FactoryGirl.create(:album, user: @existing_user)
      visit edit_album_path(@existing_album)

      fill_in "Name", with: @other_existing_album.name

      click_on "Save Album"

      expect(page).to have_content "Name has already been taken"
    end
  end
end
