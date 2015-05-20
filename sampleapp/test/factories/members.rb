FactoryGirl.define do
  factory :menber do
    sequence(:member) { |n| n + 1 }
    sequence(:name) { |n| "Taro#{n}" }
    full_name "Yamada Taro"
    sequence(:email) { |n| "taro#{n}expample.com" }
    birthday 30.year.ago
  end
end
 
