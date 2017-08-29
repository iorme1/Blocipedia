
20.times do
  User.create!(
    email: Faker::Internet.email,
    password: 123123
  )
end

users = User.all

50.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph,
    private: false,
    user: users.sample
  )
end

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
