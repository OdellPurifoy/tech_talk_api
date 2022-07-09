class PostsRepresenter
    def initialize(posts)
        @posts = posts
    end

    def as_json
        @posts.map do |post|
            {
                
            }
        end

    end

    private

    attr_reader :posts
end