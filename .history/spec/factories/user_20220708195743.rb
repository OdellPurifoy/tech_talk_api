# frozen_string_literal: true
require 'faker'

FactoryBot.define do
    factory :user do
      first_name { Faker::Name.first_name }
      last_name  { Faker::Name.last_name }
      email { Faker::Internet.email }
      username { "#{Faker::Name.first_name}_#{Faker::Name.last_name}" }
      password { "Password" }
    end
  end
  