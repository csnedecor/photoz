require "rails_helper"

feature "create a new comment" do
  # As a user,
  # I want to add a comment to an album
  # So I can tell the creator how awesome their album is
  #
  # Acceptance Criteria:
  # [] I can only leave a comment if I am logged in
  # [] I must fill in the comment field to leave a comment
  # [] The creator gets an email when I comment on their album
  # [] I can reply to others' comments
  # [] I receive an email when someone replies to my comment
  # [X] When I leave a comment, it gives me a success message and keeps me on the
  #    album page
  # [X] Comments show the time and date they were submitted, the comment body,
  #    and the username of the person who wrote it.

  context "User is signed in" do

    before(:each) do
      @existing_user = create(:user)
      sign_in(@existing_user)
      @album = create(:album)
    end

    scenario "User successfully comments on an album" do
      time = Time.local(2015, 9, 1, 12, 0, 0)
      Timecop.freeze(time)

      visit root_path
      click_on @album.name

      fill_in "comment[body]", with: "Nice album!"
      click_on "Submit"

      expect(page).to have_content "Nice album!"
      expect(page).to have_content "You successfully left a comment!"
      expect(page).to have_content Time.now.strftime("%b %d %Y %H:%M")
      within(".comment") do
        expect(page).to have_content @existing_user.username
      end
    end
  end

  context "Visitor is not signed in" do
    before(:each) do
      @album = create(:album)
    end

    scenario "Visitor can't leave a comment" do
      visit album_path(@album)

      expect(page).not_to have_field "comment[body]"
      expect(page).to have_content "Sign in to leave a comment!"
      expect(page).not_to have_button "Submit"
    end

    scenario "Visitor can see comments by others"
  end
end
