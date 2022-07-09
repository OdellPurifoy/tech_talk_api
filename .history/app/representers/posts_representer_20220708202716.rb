class PostsRepresenter
    def initialize(posts)
        @posts = posts
    end

    def as_json
        {}
    end

    private

    attr_reader :posts
end