require 'rails_helper'

RSpec.describe "Answers", type: :request do
  let!(:survey_detail) { create(:survey_detail) }
  let(:survey_id) { survey_detail.id }
  let!(:question) { create(:question, survey_detail_id: survey_detail.id) }
  let!(:options) { create_list(:option, 5, question_id: question.id) }
  let(:question_id) { question.id }
  let(:option_id) { options.first.id }

  describe "GET /questions/:question_id/options/:option_id/answer" do
    before { get "/questions/#{question_id}/options/#{option_id}/answer" }

    context 'Save the question answer' do
      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end

      it 'returns all question options' do
        answer = Answer.find_by!(question_id: question_id)
        expect(answer.option_id).to match(option_id)
      end
    end

    context 'Fails to the question answer' do
      let(:option_id) {0}

      it 'returns status code 200' do
        expect(response).to have_http_status(422)
      end

      it 'returns all question options' do
        expect(response.body).to match(/Validation failed: Option must exist/)
      end
    end
  end
end
