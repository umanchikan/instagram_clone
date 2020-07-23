50.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  user_picture = ""
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               user_picture: user_picture
               )
end
