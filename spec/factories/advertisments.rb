# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :advertisment do
    title 'buy pocket'
    body 'many pockets'
    state 'published'
  end
end
