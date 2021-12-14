require 'rails_helper'

RSpec.describe Answer, type: :model do  
  # Association test
  # ensure an Options belongs to a single Question
  it { should belong_to(:question) }

  # ensure an Options belongs to a single Question
  it { should belong_to(:option) }
end
