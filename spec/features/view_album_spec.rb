require 'rails_helper'

feature 'view album page' do
  # As a visitor
  # I want to see album details
  # So I can see all the awesome photos people have uploaded
  #
  # Acceptance Criteria:
  #
  # * [X] If I click on an album, I can see who created the album, the full album
  # description, the album name, and a list of the photos in the album
  # * [ ] If I click on a photo, I can view the photo up close and navigate through
  # the album with "Next" and "back" buttons

  scenario 'visitor goes to album detail page' do
    photo = FactoryGirl.create(:photo)

    visit root_path
    click_on photo.album.name

    expect(page).to have_content photo.album.description
  end

  scenario 'visitor navigates through photos in album' do
    photo1 = FactoryGirl.create(:photo)
    visit album_path(photo1.album)
    click_on("photo0")

    expect(find('img')['src']).to have_content "Airturbine.jpg"
  end
end
