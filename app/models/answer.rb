# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :option
end
