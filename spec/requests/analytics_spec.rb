require 'rails_helper'

RSpec.describe "Analytics", type: :request do
  # Initialize the test data
  let!(:survey_detail) { create(:survey_detail) }
  let(:survey_id) { survey_detail.id }
  let!(:question) { create(:question, survey_detail_id: survey_detail.id) }
  let!(:options) { create_list(:option, 5, question_id: question.id) }
  let(:question_id) { question.id }
  let(:id) { options.first.id }
  let!(:answer) {create(:answer, question_id: question.id, option_id: options.first.id)}


  # Test suite for GET /survey/:id/analytics
  describe "GET /survey/:id/analytics" do
    before { get "/surveys/#{survey_id}/analytics" }

    context 'when question options exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
