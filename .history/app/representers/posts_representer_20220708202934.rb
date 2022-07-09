class PostsRepresenter
    def initialize(posts)
        @posts = posts
    end

    def as_json
        @posts.map do |post|
            {
                id: post.id,
                title: post.title,
                body: post.body,
                username: post.user.username

            }
        end

    end

    private

    attr_reader :posts
end