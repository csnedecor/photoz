include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :album do
    sequence(:name) {|n| "Vacation Pics#{n}"}
    description "Here are some pics of our vacation"
    user
  end
end
