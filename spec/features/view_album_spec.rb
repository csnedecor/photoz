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

  scenario 'visitor goes to album detail page' do
    album = FactoryGirl.create(:album)

    visit root_path
    click_on album.name

    expect(page).to have_content album.description
    within('#photo0') do
      expect(find('img')['src']).to have_content "Airturbine.jpg"
    end
    within('#photo1') do
      expect(find('img')['src']).to have_content "ice-boats.jpg"
    end
  end
end
