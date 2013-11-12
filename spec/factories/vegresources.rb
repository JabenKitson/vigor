# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vegresource do
    type ""
    title "MyString"
    url "MyString"
    isbn "MyString"
    address "MyText"
    info "MyText"
    rating "MyText"
  end
end
