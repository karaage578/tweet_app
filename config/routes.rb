require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"

  post "posts/create" => "posts#create"
  
  get "/" => "home#top"
  get "about" => "home#about"

  mount Sidekiq::Web, at: "/sidekiq"
end
