include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :album do
    sequence(:name) {|n| "Vacation Pics#{n}"}
    description "Here are some pics of our vacation"
    user
  end

  factory :photo do
    photo Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/Airturbine.jpg", "image/jpg")
    album
  end
end
