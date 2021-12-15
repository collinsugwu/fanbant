# frozen_string_literal: true

class SurveysController < ApplicationController
  before_action :set_survey, only: %i[show update destroy]

  # GET /surveys
  def index
    @surveys = SurveyDetail.survey(params)
    json_response(@surveys.to_json(include: { questions: { include: :options } }))
  end

  # GET /surveys/answers
  def surveys_with_answers
    @surveys = SurveyDetail.survey_with_answers(params)
    json_response(@surveys.to_json(include: { questions: { include: %i[options answer] } }))
  end

  # POST /surveys
  def create
    @survey = SurveyDetail.create!(survey_params)
    json_response(@survey, :created)
  end

  # GET /surveys/:id
  def show
    json_response(@survey.to_json(include: { questions: { include: :options } }))
  end

  # PUT /surveys/:id
  def update
    @survey.update(survey_params)
    head :no_content
  end

  # DELETE /surveys/:id
  def destroy
    if @survey.answers.present?
      json_response('Cannot delete survey, it has an answer', 422)
    else
      @survey.destroy
      head :no_content
    end
  end

  private

  def survey_params
    # whitelist params
    params.permit(:title)
  end

  def set_survey
    @survey = SurveyDetail.includes(questions: :options).find(params[:id])
  end
end
