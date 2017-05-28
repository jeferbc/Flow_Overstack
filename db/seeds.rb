# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password(8))
end
10.times do
  question = Question.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraphs, user_id: Faker::Number.between(1, 10))
  Faker::Number.between(1, 10).times do |index|
    question.comments.create(content: Faker::Lorem.paragraph, user_id: index + 1)
    question.votes.create(liked: Faker::Boolean.boolean, user_id: index + 1)
  end
  Faker::Number.between(1, 10).times do
      answer = question.answers.create(content: Faker::Lorem.paragraph, user_id: Faker::Number.between(1, 10))
      Faker::Number.between(1, 10).times do |index|
        answer.comments.create(content: Faker::Lorem.paragraph, user_id: index + 1)
        answer.votes.create(liked: Faker::Boolean.boolean, user_id: index + 1)

      end
  end
  Faker::Number.between(1, 10).times do |index|
    question.comments.create(content: Faker::Lorem.paragraph, user_id: index + 1)
    question.votes.create(liked: Faker::Boolean.boolean, user_id: index + 1)
  end
end
