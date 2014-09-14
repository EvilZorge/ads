# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'john@gmail.com'
    password '12345678'
    role 'user'
  end
end
