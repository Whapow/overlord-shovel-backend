Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Campaigns
  get 'campaigns', to: 'campaigns#index'
  post 'campaigns', to: 'campaigns#create'
  get 'campaigns/:id', to: 'campaigns#show'
  put 'campaigns/:id', to: 'campaigns#update'
  delete 'campaigns/:id', to: 'campaigns#destroy'
  get 'campaigns/:id/inventories', to: 'campaigns#inventories'

  # Characters
  get 'campaigns/:campaign_id/characters', to: 'characters#index'
  get 'users/:user_id/characters', to: 'characters#index'
  get 'characters', to: 'characters#index'
  post 'characters', to: 'characters#create'
  put 'characters/:id', to: 'characters#update'
  delete 'characters/:id', to: 'characters#destroy'
  
  # Inventories
  get 'campaigns/:campaign_id/inventories', to: 'inventories#index'
  get 'inventories', to: 'inventories#index'
  post 'inventories', to: 'inventories#create'
  patch 'inventories/:id', to: 'inventories#update'
  delete 'inventories/:id', to: 'inventories#destroy'
  
  # Items
  get 'campaigns/:campaign_id/items', to: 'items#index'
  get 'items', to: 'items#index'
  post 'items', to: 'items#create'
  put 'items/:id', to: 'items#update'
  delete 'items/:id', to: 'items#destroy'

  # Journals
  get 'campaigns/:campaign_id/journals', to: 'journals#index'
  post 'journals', to: 'journals#create'
  put 'journals/:id', to: 'journals#update'
  delete 'journals/:id', to: 'journals#destroy'

  # Journal Entries
  get 'journals/:id/entries', to: 'entries#index'
  post 'entries', to: 'entries#create'
  put 'entries/:id', to: 'entries#update'
  delete 'entries/:id', to: 'entries#destroy'

  # Session
  get 'session', to: "sessions#show"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  # Users
  get 'profile', to: 'users#profile'
  get 'users', to: 'users#index'
  post 'users', to: 'users#create'
  post 'users/forgot_password', to: 'users#forgot_password'
  get 'users/:id', to: 'users#show'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  patch 'users/:id/reset_password', to: 'users#reset_password'

end
