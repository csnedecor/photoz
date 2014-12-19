include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :album do
    sequence(:name) {|n| "Vacation Pics#{n}"}
  end
end
