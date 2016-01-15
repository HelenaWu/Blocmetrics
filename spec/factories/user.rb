FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirm true
  end
end
