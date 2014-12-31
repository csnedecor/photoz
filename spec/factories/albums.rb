
FactoryGirl.define do
  factory :album do
    sequence(:name) {|n| "Vacation Pics#{n}"}
    description "Here are some pics of our vacation"
    user
    before :create do |album|
      album.photos << FactoryGirl.build(:photo, album: album)
      album.photos << FactoryGirl.build(:photo, album: album, photo: Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/ice-boats.jpg", "image/jpg", photo_file_name: "ice-boats.jpg"))
    end
  end
end
