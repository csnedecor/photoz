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

    album1 = FactoryGirl.create(:album, description: "Our whole family went on this awesome trip.")
    album2 = FactoryGirl.create(:album)

    visit '/'

    expect(page).to have_content album1.name
    expect(page).to have_content album1.description
    expect(page).to have_content album2.name
  end

end
