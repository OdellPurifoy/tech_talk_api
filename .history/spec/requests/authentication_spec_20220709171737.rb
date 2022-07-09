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
    end
end