require 'faker'

user = User.create(
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
).save

50.times do 
  user.posts.build(
    title: Faker::Movie.title,
    body: Faker::Lorem.paragraph(sentence_count: 5)
  ).save
end