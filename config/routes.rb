Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Campaigns
  get 'campaigns', to: 'campaigns#index'
  post 'campaigns', to: 'campaigns#create'
  get 'campaigns/:id', to: 'campaigns#show'
  patch 'campaigns/:id', to: 'campaigns#update'
  delete 'campaigns/:id', to: 'campaigns#destroy'

  # Items
  get 'campaigns/:id/items', to: 'items#index'
  post 'items', to: 'items#create'
  patch 'items/:id', to: 'items#update'
  delete 'items/:id', to: 'items#destroy'

  # Characters
  get 'campaigns/:id/characters', to: 'characters#index'
  get 'characters', to: 'characters#index'
  post 'characters', to: 'characters#create'
  patch 'characters/:id', to: 'characters#update'
  delete 'characters/:id', to: 'characters#destroy'

end
