FactoryBot.define do
    factory :question do
      title { Faker::Lorem.word }
      survey_detail_id nil
    end
end