Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :installations, only: [:index, :show]
  resources :submissions, only: [:create, :index]
  resources :anecdotes, only: [:create]
  get '/anecdotes/random', to: 'anecdotes#random'
  get '/display/:id', to: 'installations#main'

  resources :illnesses, only: [:index, :show]

  resources :researches, only: [:create]
  resources :resources, only: [:index, :show]

  resources :interests, only: [:create]

  #root 'installations#index'
  root :to => "installations#show", :id => '1'

  mount ActionCable.server, at: '/cable'
end
