# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    name "MyString"
    address "MyText"
    website "MyString"
    info "MyText"
    phone "MyString"
  end
end
