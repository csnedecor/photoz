include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :photo do
    photo_file_name "Temp.jpg"
    photo Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/Airturbine.jpg", "image/jpg")
  end
end
