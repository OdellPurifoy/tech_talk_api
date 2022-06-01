module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    argument :id, ID, required: true

    field :users, [Types::UserType], null: false
    field :user, Types::UserType, null: false 
    
    def users
      User.all
    end

    def user(id:)
      User.find(id) 
    end
  end
end
