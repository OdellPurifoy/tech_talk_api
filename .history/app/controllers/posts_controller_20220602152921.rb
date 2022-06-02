# frozen_string_literal: true

class PostsController < ApplicationController
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
  end 

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
