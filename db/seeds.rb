require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  10.times do
    survey = SurveyDetail.create!(title: Faker::Lorem.word)
    
    Question.create!(title: Faker::Lorem.word, survey_detail_id: survey.id)
  end

  questions = Question.all.each do |question|
    5.times do
      Option.create(title: Faker::Lorem.word, question_id: question.id)
    end
      Answer.create(question_id: question.id, option_id: rand(1..5))
  end
  
#   Character.create(name: 'Luke', movie: movies.first)
