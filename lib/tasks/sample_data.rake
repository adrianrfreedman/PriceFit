namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "Example",
                 last_name: "User",
                 email: "example@itf.com",
                 newsletter: true,
                 password: "foobarboobs",
                 password_confirmation: "foobarboobs")
    99.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "example-#{n+1}@itf.com"
      newsletter = true
      password  = "password"
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email: email,
                   newsletter: newsletter,
                   password: password,
                   password_confirmation: password)
      newsletter = !newsletter
    end
  end
end
