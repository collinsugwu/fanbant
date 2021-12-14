require 'rails_helper'

RSpec.describe "Surveys", type: :request do

  # initialize test data
  let!(:survey_details) { create_list(:survey_detail, 10) }
  let(:survey_detail_id) { survey_details.first.id }
  let!(:question) { create(:question, survey_detail_id: survey_details.first.id) }
  let!(:options) { create_list(:option, 5, question_id: question.id) }
  let!(:answer) {create(:answer, question_id: question.id, option_id: options.first.id)}
  
  describe "GET /surveys" do
    # make HTTP get request before each example
    before { get '/surveys' }

    it 'returns surveys' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /surveys/:id
  describe 'GET /surveys/:id' do
    before { get "/surveys/#{survey_detail_id}" }

    context 'when the record exists' do
      it 'returns the survey' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(survey_detail_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:survey_detail_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find SurveyDetail with 'id'=100/)
      end
    end
  end

   # Test suite for POST /surveys
   describe 'POST /surveys' do
    # valid payload
    let(:valid_attributes) { { title: 'Who is a man'} }

    context 'when the request is valid' do
      before { post '/surveys', params: valid_attributes }

      it 'creates a survey' do
        expect(json['title']).to eq('Who is a man')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/surveys', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /surveys/:id
  describe 'PUT /surveys/:id' do
    let(:valid_attributes) { { title: 'Who is shopping' } }

    context 'when the record exists' do
      before { put "/surveys/#{survey_detail_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /surveys/:id' do

    context 'when there is an answer ' do
      before { delete "/surveys/#{survey_detail_id}" }

      it 'can not delete survey with answer' do
        expect(response).to have_http_status(422)
      end
    end

    context "when there's no answer" do
      before(:each) do
        Answer.first.destroy
        delete "/surveys/#{survey_detail_id}"
    end
      it 'return a 204 response' do
        expect(response).to have_http_status(204)
      end
    end
    
  end
end
