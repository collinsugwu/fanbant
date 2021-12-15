# frozen_string_literal: true

class AnalyticsController < ApplicationController
  def index
   survey_detail = SurveyDetail.find(params[id])
   questions_count = survey_detail.questions.count
   options_count = 0
  survey_detail.questions.each |question| 
    options_count = question.options.count
  end

  data: {
    questions_count: questions_count,
    options_count: options_count
  }

  json_response(data)
  end
end
