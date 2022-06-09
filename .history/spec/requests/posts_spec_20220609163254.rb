require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  it 'should return all posts' do
    get '/api/v1/posts'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
  end
end
