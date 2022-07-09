require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  it 'should return all posts' do
    FactoryBot.create(:post, title: 'Test title', body: 'Test body', user: user)
    FactoryBot.create(:post, title: 'Test title2', body: 'Test body2', user: user )
    user = FactoryBot.create(:user, first_name: 'Odell', last_name: 'Test', email: 'odell@example.com', username: 'Testuser1')

    get '/api/v1/posts'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
  end
end