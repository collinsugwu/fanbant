require 'rails_helper'

RSpec.describe "Questions", type: :request do
  # Initialize the test data
  let!(:survey_detail) { create(:survey_detail) }
  let!(:questions) { create_list(:question, 20, survey_detail_id: survey_detail.id) }
  let(:survey_id) { survey_detail.id }
  let(:id) { questions.first.id }
  let!(:options) { create_list(:option, 5, question_id: questions.first.id) }
  let!(:answer) {create(:answer, question_id: questions.first.id, option_id: options.first.id)}

  # Test suite for GET /surveys/:survey_id/questions
  describe 'GET /surveys/:survey_id/questions' do
    before { get "/surveys/#{survey_id}/questions" }

    context 'when survey questions exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all survey questions' do
        expect(json.size).to eq(20)
      end
    end

    context 'when survey does not exist' do
      let(:survey_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Survey/)
      end
    end
  end

  # Test suite for GET /surveys/:survey_id/questions/:id
  describe 'GET /surveys/:survey_id/questions/:id' do
    before { get "/surveys/#{survey_id}/questions/#{id}" }

    context 'when a survey question exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the survey question' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when survey question does not exist' do
      let(:id) { 21 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Question/)
      end
    end
  end

  # Test suite for Post /surveys/:survey_id/questions
  describe 'POST /surveys/:survey_id/questions' do
    let(:valid_attributes) { { title: 'Create a question'} }

    context 'when a Survey has an answer' do
      before { post "/surveys/#{survey_id}/questions", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Cannot create question/)
      end
    end

    context 'when request attributes are valid' do
      before(:each) do
        Answer.first.destroy
        post "/surveys/#{survey_id}/questions", params: valid_attributes
    end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request attributes are invalid' do
      before(:each) do
        Answer.first.destroy
        post "/surveys/#{survey_id}/questions", params: {}
    end

      it 'returns status code 201' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end

  end

  # Test suite for PUT /surveys/:survey_id/questions/:id
  describe 'PUT /surveys/:survey_id/questions/:id' do
    let(:valid_attributes) { { title: 'Create a survey' } }

    before { put "/surveys/#{survey_id}/questions/#{id}", params: valid_attributes }

    context 'when question exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the question' do
        updated_question = Question.find(id)
        expect(updated_question.title).to match(/Create a survey/)
      end
    end

    context 'when the question does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Question/)
      end
    end
  end

  # Test suite for DELETE /surveys/:id
  describe 'DELETE /surveys/:id/question/:id' do

    context 'when there is an answer ' do
      before { delete "/surveys/#{survey_id}/questions/#{id}" }

      it 'Cannot delete survey with answer' do
        expect(response).to have_http_status(422)
      end
    end

    context "when there's no answer" do
      before(:each) do
        Answer.first.destroy
        delete "/surveys/#{survey_id}/questions/#{id}"
    end
      it 'return a 204 response' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
