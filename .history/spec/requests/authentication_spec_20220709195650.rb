# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    let!(:user) { FactoryBot.create(:user, username: "Superman", password: "Testpassword") }

    it 'authenticates the client' do
      post '/api/v1/authenticate', params: { username: user.username , password: user.password }

      expect(response).to have_http_status(:created)
      expect(response_body).to eq({
                                    'token' => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMTB9.DPsTV7D2XOZY-4K7GEr3qEijspUT9yUMLwXaouCgflQ'
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
      expect(response_body).to eq({
                                    'error' => 'param is missing or the value is empty: password'
                                  })
    end
  end
end
