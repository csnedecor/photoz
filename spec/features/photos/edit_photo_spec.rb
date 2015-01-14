require "rails_helper"

feature "Edit a photo" do
  # As a user,
  # I want to be able to crop my photo
  # So that my album displays the best version of it

  # [X] When I click the 'Crop' button, my photo is cropped
  #    with dimensions of 5:7, I am redirected to the photo's
  #    show page, and given a success message
  # [X] If I am not the owner of the album, I cannot edit the photo
  # [X] If I am not the owner of the album, I cannot see the option to
  #    edit the photo on the photo's show page
  # [X] If I crop the image, the album and the small version of the album
  #    shows the cropped version

  context "User is signed in and has an album" do
    before(:each) do
      @existing_user = FactoryGirl.create(:user)
      @album = FactoryGirl.create(:album, user: @existing_user)
      @photo = @album.photos.first
      sign_in(@existing_user)
    end

    scenario "User successfully crops a photo" do
      visit album_photo_path(@album, @photo)

      click_on "Edit Photo"

      expect(page).to have_content "Edit Your Photo"

      find("#crop_x").set(184)
      find("#crop_y").set(107)
      find("#crop_w").set(219)
      find("#crop_h").set(156)

      click_on "Crop"

      expect(page).to have_content "Successfully cropped photo"
    end

    scenario "User can't edit another user's photo" do
      other_album = create(:album)
      visit album_photo_path(other_album, other_album.photos.first)

      expect(page).not_to have_content "Edit Photo"

      visit edit_album_photo_path(other_album, other_album.photos.first)

      expect(page).to have_content "You can't edit someone else's photo"
      expect(page).not_to have_content "Edit Your Photo"
    end
  end

  context "Visitor is not signed in" do
    scenario "Visitor can't edit a photo" do
      album = create(:album)
      photo = album.photos.first

      visit album_photo_path(album, photo)

      expect(page).not_to have_content "Edit photo"

      visit edit_album_photo_path(album, photo)

      expect(page).to have_content "You must be signed in to do that"
    end
  end
end
