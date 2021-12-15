# frozen_string_literal: true

class SurveyDetail < ApplicationRecord
  # model association
  has_many :questions, dependent: :destroy

  has_many :answers, through: :questions

  # validations
  validates_presence_of :title

  # Ex:- scope :active, -> {where(:active => true)}

  scope :survey, lambda { |params|
                   includes(questions: :options)
                     .paginate(page: params[:page], per_page: 10)
                 }

  scope :survey_with_answers, lambda { |params|
                                includes({ questions: %i[options answer] })
                                  .paginate(page: params[:page], per_page: 10)
                              }

  def self.analytics(params)
    survey_detail = includes(:questions).find(params[:id])
    questions_count = survey_detail.questions.count
    options_count = 0
    survey_detail.questions.each { |question| options_count = question.options.count }
    {
      questions_count: questions_count,
      options_count: options_count
    }
  end
  # Ex:- scope :active, -> {where(:active => true)}
end
