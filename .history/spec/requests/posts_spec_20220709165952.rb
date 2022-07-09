# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  describe 'GET /posts' do
    let(:user_1) { FactoryBot.create(:user, username: 'Sanda_Rutherford') }
    let(:user_2) { FactoryBot.create(:user, username: 'Lyndon_Koss') }

    before do
      FactoryBot.create(:post, id: 55, title: 'Test title', body: 'Test body', user: user_1)
      FactoryBot.create(:post, id: 56, title: 'Test title2', body: 'Test body2', user: user_2)
    end

    it 'should return all posts' do
      get '/api/v1/posts'

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(3)
      expect(response_body).to eq(
        [
          { 'body' => 'Test body',
            'id' => 55,
            'title' => 'Test title',
            'username' => 'Lyndon_Koss' },
          { 'body' => 'Test body',
            'id' => 55,
            'title' => 'Test title',
            'username' => 'Sanda_Rutherford' },
          { 'body' => 'Test body2',
            'id' => 56,
            'title' => 'Test title2',
            'username' => 'Lyndon_Koss' }
        ]
      )
    end

    it 'returns a subset of posts based on limit' do
      get '/api/v1/posts', params: { limit: 1 }

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
    end

    it 'returns a subset of post based on limit AND offset' do
      get '/api/v1/posts', params: { limit: 1, offset: 1 }

      expect(response_body).to eq([
        { 'body' => 'Test body',
          'id' => 55,
          'title' => 'Test title',
          'username' => 'Sanda_Rutherford' }
      ])
    end
  end

  describe 'POST /posts' do
    it 'should create a new post' do
      expect do
        post '/api/v1/posts', params: {
          post: { title: 'Post Title', body: 'Post body' },
          user: { first_name: 'Jeff', last_name: 'Gordon', email: 'jg@example.com', username: '24ever',
                  password: '24ever24' }
        }
      end.to change { Post.count }.from(1).to(2)

      expect(response).to have_http_status(:created)
      expect(User.count).to eq(2)
      expect(response_body).to eq(
        {
          'id' => 55,
          'title' => 'Post Title',
          'body' => 'Post body',
          'username' => '24ever'
        }
      )
    end
  end

  describe 'DELETE /posts/:id' do
    let(:user) { FactoryBot.create(:user) }
    let!(:post) { FactoryBot.create(:post, title: 'Test title', body: 'Test body', user: user) }

    it 'deletes a post' do
      expect do
        delete "/api/v1/posts/#{post.id}"
      end.to change { Post.count }.from(2).to(1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
