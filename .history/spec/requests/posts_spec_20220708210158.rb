require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  
  describe 'GET /posts'do
    before do
      FactoryBot.create(:post, title: 'Test title', body: 'Test body', user: FactoryBot.create(:user) )
      FactoryBot.create(:post, title: 'Test title2', body: 'Test body2', user: FactoryBot.create(:user) )
    end

    it 'should return all posts' do

      get '/api/v1/posts'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'POST /posts' do
    # let!(:user) { FactoryBot.create(:user) }

    it 'should create a new post' do
      expect {
        post '/api/v1/posts', params: { 
          post: { title: 'Post Title', body: 'Post body' },
          user: { first_name: 'Jeff', last_name: 'Gordon', email: 'jg@example.com', username: '24ever', password: '24ever24' } 
        }
      }.to change { Post.count }.from(1).to(2)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /posts/:id' do
    let(:user) { FactoryBot.create(:user) }
    let!(:post) { FactoryBot.create(:post, title: 'Test title', body: 'Test body', user: user ) }

    it 'deletes a post' do
      expect {
        delete "/api/v1/posts/#{post.id}"
      }.to change { Post.count }.from(2).to(1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
