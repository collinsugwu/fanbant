# frozen_string_literal: true

class AnalyticsController < ApplicationController
  # GET surveys/:id/analytics
  def index
    survey_analytics = SurveyDetail.analytics(params)
    json_response(survey_analytics)
  end
end
