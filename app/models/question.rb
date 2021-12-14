# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :survey_detail
  has_many :options, dependent: :destroy
  has_one :answer

  # validations
  validates_presence_of :title
end
