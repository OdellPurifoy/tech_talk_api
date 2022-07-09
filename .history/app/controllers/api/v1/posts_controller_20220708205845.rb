# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all

        render json: PostsRepresenter.new(posts).as_json
      end

      def create
        user = User.create(user_params)
        post = Post.create!(post_params)

        if post.save
          render json: post, status: :created
        else
          render json: post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Post.find(params[:id]).destroy!

        head :no_content
      end

      private

      def post_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
      end

      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
    end
  end
end
