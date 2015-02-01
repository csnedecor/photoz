require "rails_helper"

feature "view a user profile" do
  before(:each) do
    @user = create(:user)
    sign_in(@user)
  end
  scenario "User views their own profile" do

    visit user_path(@user)

    expect(page).to have_content @user.email
  end

  scenario "User views another user's profile" do
    user2 = create(:user)

    visit user_path(user2)

    expect(page).not_to have_content @user.email
  end
end
