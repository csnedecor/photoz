require 'rails_helper'

feature "Albums" do

  it "displays all albums on the front page" do
    album1 = FactoryGirl.create(:album, description: "Our whole family went on this awesome trip.")
    album2 = FactoryGirl.create(:album)

    visit '/'

    expect(page).to have_content album1.name
    expect(page).to have_content album1.description
    expect(page).to have_content album2.name
  end

end
