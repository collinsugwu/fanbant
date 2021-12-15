# frozen_string_literal: true

class AnswersController < ApplicationController
  # GET /questions/:question_id/options/:option_id/answer
  def answer
    @answer = Answer.create!(answer_params)
    json_response(@answer, :created)
  end

  private

  def answer_params
    params.permit(:question_id, :option_id)
  end
end
