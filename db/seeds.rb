require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.email,
    confirm: true,
    password: 'helloworld'
  )
end
users = User.all

20.times do
  RegisteredApplication.create!(
    name: Faker::Company.name,
    URL: Faker::Internet.url,
    user: users.sample
  )
end
apps = RegisteredApplication.all

50.times do
  Event.create!(
    name: Faker::Hacker.verb,
    registered_application: apps.sample
  )
end

events = Event.all
puts "#{Event.count} events in DB"
puts "#{RegisteredApplication.count} applications in DB"
puts "#{User.count} users in DB"
