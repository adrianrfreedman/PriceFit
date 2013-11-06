FactoryGirl.define do
  factory :user do
    first_name  "Johnny"
    last_name   "Poo-Poo Pants"
    email       "jppp@itf.com"
    newsletter   true
    password    "foofwoof"
    password_confirmation "foofwoof"
  end
end
