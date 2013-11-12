FactoryGirl.define do
  factory :user do
    sequence(:first_name)  { "Person" }
    sequence(:last_name)  { |n| "#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobarboobs"
    password_confirmation "foobarboobs"

    factory :admin do
      admin true
    end
  end
end
