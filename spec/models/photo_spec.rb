require "rails_helper"

describe Photo do

  describe "attributes" do
    it { should respond_to :photo_file_name }
    it { should respond_to :photo_content_type }
    it { should respond_to :photo_file_size }
    it { should respond_to :photo_updated_at }
    it { should respond_to :album_id }
  end

  describe "assocations" do
    it { should belong_to :album }
  end

  describe "cropping" do
    it { should respond_to :crop_x }
    it { should respond_to :crop_y }
    it { should respond_to :crop_w }
    it { should respond_to :crop_h }

    it "defaults to not cropping" do
      expect(subject.cropping?).to be_falsey
    end

    it "cropping if all cropping variables set" do
      subject.crop_x = 0
      subject.crop_y = 0
      subject.crop_w = 0
      subject.crop_h = 0
      expect(subject.cropping?).to be_truthy
    end
  end
end
