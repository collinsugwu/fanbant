# frozen_string_literal: true

class Option < ApplicationRecord
  belongs_to :question

  # validations
  validates_presence_of :title
end
