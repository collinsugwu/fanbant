require 'rails_helper'

RSpec.describe SurveyDetail, type: :model do
  # Association test
  # ensure SurveyDetail model has a 1:m relationship with the question model
  it { should have_many(:questions).dependent(:destroy) }

  # Validation tests
  # ensure column title is present before saving
  it { should validate_presence_of(:title) }
end
