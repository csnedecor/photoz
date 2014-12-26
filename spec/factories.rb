include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :album do
    sequence(:name) {|n| "Vacation Pics#{n}"}
    description "Here are some pics of our vacation"
    user
  end

  factory :photo do
    ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/Airturbine.jpg"), :filename => "Airturbine.jpg")
    album
  end
end
