User.create!(name:                  "Example User",
             first_name:            "Exampple",
             last_name:             "User",
             email:                 "example@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:                 true,
             activated:             true,
             activated_at:          Time.zone.now)

99.times do |n|
  name =       Faker::Name.name
  first_name = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:                  name,
               first_name:            first_name,
               last_name:             last_name,
               email:                 email,
               password:              password,
               password_confirmation: password,
               activated:             true,
               activated_at:          Time.zone.now)
end
