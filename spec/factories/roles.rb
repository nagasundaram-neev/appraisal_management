# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    name "Manager"
  end
  factory :invalid_role, class: Role do
    name nil
  end
end
