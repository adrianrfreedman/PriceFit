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

  factory :dress_size do
    brand "Dressy"
    size  8
    bust  72
    waist 80
    hip   83
  end

  factory :brand do
    name "Asos"
    website "www.asos.com"
    country "United Kingdom"
  end
end
