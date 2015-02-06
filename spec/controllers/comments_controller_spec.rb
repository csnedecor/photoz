require "rails_helper"

describe CommentsController do
  describe "POST create" do
    context "when user is not signed in" do
      before(:each) do
        @album = create(:album)
        @comment = { body: "hi", album_id: @album.id }
      end

      it "does not create a comment" do
        expect { post :create, @comment }.to change(Comment, :count).by(0)
      end
    end
  end
end
