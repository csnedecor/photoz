require 'rails_helper'

feature "View albums" do

  scenario "view a list of albums on home page" do

    # As a visitor to the Photoz website,
    # I want to view a list of albums
    # So I can see what cool photos people have posted
    #
    # Acceptance Criteria:
    #
    # * [ ] If I navigate to the home page, I should see a list of all albums with the
    # username, a cover photo, the album title and a truncated description (150 or less).

    photo1 = FactoryGirl.create(:photo)
    photo2 = FactoryGirl.create(:photo)

    visit root_path

    expect(page).to have_content photo1.album.name
    expect(page).to have_content photo1.album.description
    expect(page).to have_content photo2.album.name
  end

end
