# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :department do
    name 'BU3'
  end
  factory :department2, class: Department do
    name 'BU2'
  end
end
