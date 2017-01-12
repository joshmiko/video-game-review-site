FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    sequence(:email) { |n| "user#{n}@email.com" }
    password 'password'
    password_confirmation 'password'
    role 'user'
   end

end
