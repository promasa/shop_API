Rails.application.routes.draw do
  resource :sign_up, only: [:create]
  resource :sign_in, only: [:create]
  resources :users, only: [:update, :destroy, :index, :show]
  resources :items, only: [:create, :update, :destroy, :index, :show]
  resources :purchases, only:[:create, :destroy]

  get "my_item", to: "my_pages#my_item"
  get "bought", to: "my_pages#bought"

  post "items/:item_id/chats", to: "item_chats#create"
  delete "items/:item_id/chats/:id", to: "item_chats#destroy"
  get "items/:item_id/chats", to:"item_chats#index"
  get "items/:item_id/chats/:id", to:"item_chats#show"
  put "items/:item_id/chats/:id", to:"item_chats#update"

  post "users/private_chats", to: "private_chats#create"
  get "users/private_chats/:id", to: "private_chats#show"
end
