# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[create show index]
  resources :posts, only: %i[create, index, destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
