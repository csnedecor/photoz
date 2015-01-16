require "rails_helper"

feature "User sees analytics" do

  # As a user,
  # I want to be able to view the analytics for my page
  # So that I can keep track of which albums are most popular
  #
  # Acceptance Criteria:
  #
  # [X] I must be logged in to view my page analytics
  # [X] I can only see my own album's analytics
  # [X] I can see how many page visits I've had
  # [X] I can see unique pageviews
  # [] I can see where in the world pageviews are coming from
  # [] I can see the average amount of time people spend on my page

  scenario "A visitor visits an album page, pageviews increment" do
    user = create(:user)
    album = create(:album, user: user)

    visit album_path(album)

    sign_in(user)

    visit album_path(album)

    click_on "View Album Analytics"

    expect(page).to have_content "Pageviews: 2"
    expect(page).to have_content "Unique Pageviews: 1"
  end

  scenario "Visitor tries to view an album's analytics" do
    album = create(:album)

    visit album_path(album)

    expect(page).not_to have_link "View Album Analytics"

    visit album_analytics_path(album)

    expect(page).to have_content "You must be signed in to do that"
    expect(page).not_to have_content "Pageviews"
  end

  scenario "User tries to view another user's analytics" do
    album = create(:album)
    user = create(:user)
    sign_in(user)

    visit album_path(album)

    expect(page).not_to have_link "View Album Analytics"

    visit album_analytics_path(album)

    expect(page).to have_content "You can't view another user's analytics"
    expect(page).not_to have_content "Pageviews"
  end

end
