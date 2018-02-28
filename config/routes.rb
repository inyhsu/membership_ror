Rails.application.routes.draw do
  root "users#new"
  get "sessions" => "sessions#new"
  post "sessions" => "sessions#create"
  get "users" => "users#new"
  post "users" => "users#create"
  delete "sessions/:id" => "sessions#destroy"
  get "groups/:id" => "groups#show"
  get "groups" => "groups#groups"
  post "groups" => "groups#create"
  delete "groups/:id" => "groups#destroy"
  post "joins/:id" => "joins#create"
  delete "joins/:id" => "joins#destroy"
end
