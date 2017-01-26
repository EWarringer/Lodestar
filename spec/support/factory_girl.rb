require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "johnnayyy#{n}"}
    sequence(:email) {|n| "johnsmith#{n}@example.com" }
    sequence(:first_name) {|n| "John#{n}" }
    sequence(:last_name) {|n| "Smith#{n}" }
    password 'password'
    password_confirmation 'password'
  end
end
