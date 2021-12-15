# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_survey
  before_action :set_survey_question, only: %i[show update destroy]

  # GET /surveys/:survey_id/questions
  def index
    @questions = @survey.questions.includes(:survey_detail, :options)
    json_response(@questions.to_json(include: %i[survey_detail options]))
  end

  # GET /surveys/:survey_id/questions/:id
  def show
    json_response(@question.to_json(include: %i[survey_detail options]))
  end

  # POST /surveys/:survey_id/questions
  def create
    if @survey.answers.present?
      json_response('Cannot create question, it has an answer', 422)
    else
      @survey.questions.create!(question_params)
      json_response(@survey, :created)
    end
  end

  # PUT /surveys/:survey_id/questions/:id
  def update
    @question.update(question_params)
    head :no_content
  end

  # DELETE /surveys/:survey_id/questions/:id
  def destroy
    if @question.answer.present?
      json_response('Cannot delete question, it has an answer', 422)
    else
      @question.destroy
      head :no_content
    end
  end

  private

  def question_params
    params.permit(:title)
  end

  def set_survey
    @survey = SurveyDetail.find(params[:survey_id])
  end

  def set_survey_question
    @question = @survey.questions.includes(:survey_detail, :options).find_by!(id: params[:id]) if @survey
  end
end
