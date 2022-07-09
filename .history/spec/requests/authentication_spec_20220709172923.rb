# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    it 'authenticates the client' do
      post '/api/v1/authenticate', params: { username: 'Postman99', password: 'Password' }

      expect(response).to have_http_status(:created)
      expect(response_body).to eq({
                                    'token' => '123'
                                  })
    end

    it 'returns an error when username is missing' do
      post '/api/v1/authenticate', params: { password: 'Password' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to eq({
          'error' => 'param is missing or the value is empty: username'
      })
    end

    it 'returns an error when password is missing' do
      post '/api/v1/authenticate', params: { username: 'Postman99' }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
