require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  describe 'GET /posts'do
    it 'should return all posts' do
      FactoryBot.create(:post, title: 'Test title', body: 'Test body', user: FactoryBot.create(:user, first_name: 'Odell', last_name: 'Test', email: 'odell@example1132.com', username: 'Testuser1wert', password: 'password'))
      FactoryBot.create(:post, title: 'Test title2', body: 'Test body2', user: FactoryBot.create(:user, first_name: 'Odell', last_name: 'Test', email: 'odell@example123132.com', username: 'Testuser1werfw', password: 'password') )

      get '/api/v1/posts'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /posts' do
    it 'should create a new post' do

      post '/api/v1/posts', params: { post: { title: 'Post Title', body: 'Post body'} }

      expect(response).to have_http_status(:created)
    end
  end

end
