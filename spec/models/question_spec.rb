require 'rails_helper'

RSpec.describe Question, type: :model do
  # Association test
  # ensure an Question belongs to a single Survey
  it { should belong_to(:survey_detail) }

  # ensure an Question has many options
  it { should have_many(:options).dependent(:destroy) }

  it { should have_one(:answer) }

  # Validation tests
  # ensure columns title is present before saving
  it { should validate_presence_of(:title) }
end
