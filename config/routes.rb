Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Campaigns
  get 'campaigns', to: 'campaigns#index'
  post 'campaigns', to: 'campaigns#create'
  get 'campaigns/:id', to: 'campaigns#show'
  patch 'campaigns/:id', to: 'campaigns#update'
  delete 'campaigns/:id', to: 'campaigns#destroy'

  # Characters
  get 'campaigns/:campaign_id/characters', to: 'characters#index'
  get 'users/:user_id/characters', to: 'characters#index'
  get 'characters', to: 'characters#index'
  post 'characters', to: 'characters#create'
  patch 'characters/:id', to: 'characters#update'
  delete 'characters/:id', to: 'characters#destroy'
  
  # Items
  get 'campaigns/:campaign_id/items', to: 'items#index'
  post 'items', to: 'items#create'
  patch 'items/:id', to: 'items#update'
  delete 'items/:id', to: 'items#destroy'

  # Journals
  get 'campaigns/:campaign_id/journals', to: 'journals#index'
  post 'journals', to: 'journals#create'
  patch 'journals/:id', to: 'journals#update'
  delete 'journals/:id', to: 'journals#destroy'

  # Journal Entries
  get 'journals/:id/entries', to: 'entries#index'
  post 'entries', to: 'entries#create'
  patch 'entries/:id', to: 'entries#update'
  delete 'entries/:id', to: 'entries#destroy'

  # Session
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  # Users
  get 'users', to: 'users#index'
  post 'users', to: 'users#create'
  get 'users/:id', to: 'users#show'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'


end
