# frozen_string_literal: true

class SurveyDetail < ApplicationRecord
  # model association
  has_many :questions, dependent: :destroy

  has_many :answers, through: :questions

  # validations
  validates_presence_of :title

  scope :has_answer, lambda {
    joins(:questions).all
  }
  # Ex:- scope :active, -> {where(:active => true)}
end
