FactoryBot.define do
    factory :option do
      title { Faker::Lorem.word }
      question_id nil
    end
end