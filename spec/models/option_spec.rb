require 'rails_helper'

RSpec.describe Option, type: :model do
  # Association test
  # ensure an Options belongs to a single Question
  it { should belong_to(:question) }

  # Validation tests
  # ensure columns title is present before saving
  it { should validate_presence_of(:title) }
end
