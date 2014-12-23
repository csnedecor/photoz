require 'rails_helper'

feature 'Create a new album' do
  
  # As a user,
  # I want to create an album of photos
  # So that I can show it off to my friends
  #
  # Acceptance Criteria:
  #
  # * [X] I can only create an album if I am signed in
  # * [ ] I must enter a name, description and at least one photo
  # * [ ] If all fields are complete, I am told that my album has been saved.
  # * [ ] If a field is incomplete, I am given an error message and brought back to
  # the create page
  # * [ ] If an album has the same name as one that is in the database, I get an error
  # message
  # * [ ] I can upload many photos to the album
  # * [ ] The photo album is associated with my username

  scenario"user tries to create new album when not signed in" do
    visit '/'
    click_on "New Album"

    expect(page).to have_content "You must be signed in to do that."
  end
end
