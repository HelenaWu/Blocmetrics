FactoryGirl.define do
  factory :user do
    email "helena.wu87@gmail.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed true
  end
end
