require 'rails_helper'

feature "View albums" do

  scenario "view a list of albums on home page" do

    # As a visitor to the Photoz website,
    # I want to view a list of albums
    # So I can see what cool photos people have posted
    #
    # Acceptance Criteria:
    #
    # * [X] If I navigate to the home page, I should see a list of all albums with the
    # username, a cover photo, and the album's title.

    album = FactoryGirl.create(:album)

    visit root_path

    expect(page).to have_content album.name
    expect(page).to have_content album.user.username
    expect(page).to have_content album.name
  end

end
