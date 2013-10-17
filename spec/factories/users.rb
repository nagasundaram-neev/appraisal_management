# Reat
# about factories at https://github.com/thoughtbot/factory_girl


FactoryGirl.define do
  factory :user do
    email 'abc@gmail.com'
    password 'foobar123'
    password_confirmation 'foobar123'
    first_name 'naga'
    last_name 'sundaram'
    gender 'M'
    phone_no '+919942354883'
    confirmed_at Time.now
  end
end
FactoryGirl.define do
  factory :appraiser, class: User  do
    email 'def@neevtech.com'
    password '12345678'
    password_confirmation '12345678'
    first_name 'test'
    last_name 'neevtech'
    gender 'M'
    phone_no '+919942354883'
    role 'appraiser'
    confirmed_at Time.now
  end
end

FactoryGirl.define do
  factory :admin, class: User  do
    email 'ghi@neevtech.com'
    password '12345678'
    password_confirmation '12345678'
    first_name 'test'
    last_name 'neevtech'
    gender 'M'
    phone_no '+919942354883'
    role 'admin'
    confirmed_at Time.now
  end
end

