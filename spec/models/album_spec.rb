require "rails_helper"

describe Album do
  let(:blanks) { ["", nil] }

  describe "validations" do
    it { should have_valid(:name).when("a", "Album Name", "32") }
    it { should_not have_valid(:name).when(*blanks) }

    it "should be valid when description exists" do
      should have_valid(:description).when("a", "Writing all the things", "32")
    end
    it { should_not have_valid(:name).when(*blanks) }

    it "must have at least one photo" do
      album = Album.new
      album.save
      expect(album.errors[:photos]).to include(
        "You must attach at least one photo"
        )
    end
  end

  describe "deleted album" do
    it "deletes its photos when it is destroyed" do
      album = create(:album)
      expect { album.destroy }.to change(Photo, :count).by(-2)
    end
  end

  describe "associations" do
    it { should have_many :photos }
    it { should belong_to :user }
  end
end
