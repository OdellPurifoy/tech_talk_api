# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessionsrs#destroy'
  post '/authorized', to: 'sessions#show'
  post '/dashboard', to: 'users#show'

  resources :users, only: %i[create show index]
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
