require 'rails_helper'

RSpec.describe "Options", type: :request do
  # Initialize the test data
  let!(:survey_detail) { create(:survey_detail) }
  let(:survey_id) { survey_detail.id }
  let!(:question) { create(:question, survey_detail_id: survey_detail.id) }
  let!(:options) { create_list(:option, 5, question_id: question.id) }
  let(:question_id) { question.id }
  let(:id) { options.first.id }
  let!(:answer) {create(:answer, question_id: question.id, option_id: options.first.id)}

  # Test suite for GET /surveys/:survey_id/questions/:question_id/options
  describe 'GET /surveys/:survey_id/questions/question_id/options' do
    before { get "/surveys/#{survey_id}/questions/#{question_id}/options" }

    context 'when question options exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all question options' do
        expect(json.size).to eq(5)
      end
    end

    context 'when question does not exist' do
        let(:question_id) { 0 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
  
        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Question/)
        end
      end
  end

  # Test suite for GET /surveys/:survey_id/questions/:question_id/options/:id
  describe 'GET /surveys/:survey_id/questions/:question_id/options/:id' do
    before { get "/surveys/#{survey_id}/questions/#{question_id}/options/#{id}" }

    context 'when question options exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the question option' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when question option does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Option/)
      end
    end
  end

  # Test suite for Post /surveys/:survey_id/questions/:question_id/options
  describe 'POST /surveys/:survey_id/questions/:question_id/options' do
    let(:valid_attributes) { { title: 'Create an option'} }

    context 'when a Survey has an answer' do
      before { post "/surveys/#{survey_id}/questions/#{question_id}/options", params: valid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Can not create an option/)
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

  # Test suite for PUT /surveys/:survey_id/questions/:question_id/options/:id
  describe 'PUT /surveys/:survey_id/questions/:question_id/options/:id' do
    let(:valid_attributes) { { title: 'Update an option' } }

    before { put "/surveys/#{survey_id}/questions/#{question_id}/options/#{id}", params: valid_attributes }

    context 'when option exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the Option' do
        updated_question = Option.find(id)
        expect(updated_question.title).to match(/Update an option/)
      end
    end

    context 'when the option does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Option/)
      end
    end
  end

  # Test suite for DELETE /surveys/:survey_id/questions/:question_id/options/:id
  describe 'DELETE /surveys/:survey_id/questions/:question_id/options/:id' do
    context 'when there is an answer ' do
      before { delete "/surveys/#{survey_id}/questions/#{question_id}/options/#{id}" }

      it 'can not delete survey with answer' do
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
