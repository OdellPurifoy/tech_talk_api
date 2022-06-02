# frozen_string_literal: true

class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  def index
    render json: Post.all
  end

  def create
    post = Post.create(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id]).destroy!
    
    head :no_content
  rescue ActiveRecord::RecordNotDestroyed
    render json: {}, status: :unprocessable_entity
  end 

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
