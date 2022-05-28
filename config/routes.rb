# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :members, skip: :sessions
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'

  # post '/login', to: 'sessions#create'
  # post '/logout', to: 'sessions#destroy'
  # get '/logged_in', to: 'sessions#is_logged_in?'

  # resources :users, only: %i[create show index] do
  #   resources :posts, only: %i[create show index destroy]
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
