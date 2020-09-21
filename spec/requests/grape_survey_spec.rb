require 'spec_helper'

describe 'GrapeSurveys' do
  describe 'GET /v1/grape_surveys' do
    describe 'should return grape_survey list' do
      before do
        @grape_survey = create(:grape_survey)
        get '/v1/grape_surveys'
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'GET /v1/grape_surveys/:id' do
    describe 'should return grape_survey details' do
      before do
        @grape_survey = create(:grape_survey)
        get "/v1/grape_surveys/#{@grape_survey.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'POST /v1/grape_surveys' do
    describe 'should save parameters' do
      before do
        post '/v1/grape_surveys'
      end

      it 'returns 201 success status' do
        expect(response.response_code).to eq 201
      end
    end
  end

  describe 'PUT /v1/grape_surveys/:id' do
    describe 'should save parameters' do
      before do
        @grape_survey = create(:grape_survey)
        put "/v1/grape_surveys/#{@grape_survey.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'DELETE /v1/grape_surveys/:id' do
    describe 'should delete grape_survey' do
      before(:each) do
        @grape_survey = create(:grape_survey)
        delete "/v1/grape_surveys/#{@grape_survey.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end
end
