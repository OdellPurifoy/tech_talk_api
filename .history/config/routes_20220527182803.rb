# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'

  post '/login', to: 'session#create'
  post '/logout', to: 'session#destroy'
  get '/logged_in', to: 'session#is_logged_in?'

  resources :users, only: %i[create show index] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
