require 'faker'

10.times do
    user = User.create(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
  
    Post.create(
      user: user,
      title: Faker::Movie.title,
      body: Faker::Date.between(from: '2000-01-01', to: '2021-01-01').year,
    )
end