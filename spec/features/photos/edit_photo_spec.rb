require "rails_helper"

feature "Edit a photo" do
  # As a user,
  # I want to be able to crop my photo
  # So that my album displays the best version of it

  # [] When I click the 'Edit Photo' button, I have the option to crop it
  #    with dimensions of 16:9
  # [] If I am not the owner of the album, I cannot edit the photo
  # [] If I am not the owner of the album, I cannot see the option to
  #    edit the photo on the photo's show page
  # [] If I crop the image, the album and the small version of the album
  #    shows the cropped version
  # [] When I upload the image, it is automatically cropped to show the center of the image

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

    end
  end
end
