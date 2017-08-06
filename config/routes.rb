Rails.application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :installations, only: [:index, :show]
  resources :submissions, only: [:create, :index]
  resources :anecdotes, only: [:create]
  get '/anecdotes/random', to: 'anecdotes#random'
  
  resources :illnesses, only: [:index, :show]
  
  resources :researches, only: [:create]
  resources :resources, only: [:index, :show]
  
  root 'installations#index'

end
