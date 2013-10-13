# Read about factories at https://github.com/thoughtbot/factory_girl


FactoryGirl.define do
  factory :user do
    email 'naga@gmail.com'
    password 'foobar123'
    password_confirmation 'foobar123'
    first_name 'naga'
    last_name 'sundaram'
    gender 'M'
    phone_no '+919942354883'
    confirmed_at Time.now
  end

  factory :admin, class: User  do
    email 'admin@neevtech.com'
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

