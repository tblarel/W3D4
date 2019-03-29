require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


50.times do 
  User.new('username' => Faker::Name.name)
end

4.times do
  Poll.new('title' => Faker::Lorem.sentence, 'user_id'=> rand(1..49))
end

20.times do
  Question.new('poll_id' => rand(1..4), 'text' => Faker::Lorem.sentence)
end

50.times do 
  AnswerChoice.new('question_id' => rand(1..20), 'text' => Faker::Lorem.sentence)
end

10.times do 
  Response.new('respondent' => rand(1..49), 'question_id' => rand(1..20))
end



