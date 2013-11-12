# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vrhighlight do
    price "9.99"
    date_observed "2013-03-05"
    name "MyString"
    product_url "MyString"
    recipe_url "MyString"
    user_id 1
    description "MyText"
    rating 1
  end
end
