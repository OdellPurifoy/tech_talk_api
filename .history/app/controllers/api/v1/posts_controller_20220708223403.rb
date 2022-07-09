# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      MAX_PAGINATION_LIMIT = 100

      def index
        posts = Post.limit(limit).offset(params[:offset])

        render json: PostsRepresenter.new(posts).as_json
      end

      def create
        user = User.create(user_params)
        post = Post.create!(post_params.merge(user_id: user.id))

        if post.save
          render json: PostRepresenter.new(post).as_json, status: :created
        else
          render json: post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Post.find(params[:id]).destroy!

        head :no_content
      end

      private

      def limit
        [params.fetch(:limit, 100).to_i, 100].min
      end

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
      end

      def post_params
        params.require(:post).permit(:title, :body)
      end
    end
  end
end
