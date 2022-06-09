require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  it 'should return all posts' do
    FactoryBot.create(:post, title: 'Test title', body: 'Test body' )
    FactoryBot.create(:post, title: 'Test title2', body: 'Test body2' )

    get '/api/v1/posts'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
  end
end
