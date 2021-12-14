# frozen_string_literal: true

class OptionsController < ApplicationController
  before_action :set_survey_question
  before_action :set_question_option, only: %i[show update destroy]

  # GET /surveys/:survey_id/questions/:question_id/options
  def index
    json_response(@question.options)
  end

  # GET /surveys/:survey_id/questions/:question_id/options/:id
  def show
    json_response(@option)
  end

  # POST /surveys/:survey_id/questions/:question_id/options
  def create
    if @question.survey_detail.answers.present?
      json_response('Cannot create option', 422)
    else
      @question.options.create!(option_params)
      json_response(@question, :created)
    end
  end

  # PUT /surveys/:survey_id/questions/:question_id/options/:id
  def update
    @option.update(option_params)
    head :no_content
  end

  # DELETE /surveys/:survey_id/questions/:question_id/options/:id
  def destroy
    if @question.survey_detail.answers.present?
      json_response('Cannot delete option', 422)
    else
      @option.destroy
      head :no_content
    end
  end

  private

  def option_params
    params.permit(:title)
  end

  def set_survey_question
    @question = Question.find(params[:question_id])
  end

  def set_question_option
    @option = @question.options.find_by!(id: params[:id]) if @question
  end
end
