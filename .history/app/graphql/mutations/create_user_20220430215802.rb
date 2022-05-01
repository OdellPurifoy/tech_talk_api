# frozen_string_literal: true

module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(first_name:, last_name:, email:)
      user = User.first_or_create!(first_name: first_name, last_name: last_name, email: email)
      byebug

      if user
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
