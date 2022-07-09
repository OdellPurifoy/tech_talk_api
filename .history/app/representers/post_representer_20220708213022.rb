# frozen_string_literal: true

class PostRepresenter
    def initialize(post)
      @post = post
    end
  
    def as_json
        {
          id: @post.id,
          title: @post.title,
          body: @post.body,
          username: @post.user.username
        }
    end
  
    private
  
    attr_reader :posts
  end
  