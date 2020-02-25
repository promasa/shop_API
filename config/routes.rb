Rails.application.routes.draw do
  resource :sign_up, only: [:create]
  resource :sign_in, only: [:create]
  resources :users, only: [:update, :destroy, :index, :show]
  resources :items, only: [:create, :update, :destroy, :index, :show]

  #購入
  post "items/:id/purchases", to: "purchases#create" 
  #購入取り消し
  delete "items/:id/purchases", to: "purchases#destroy"
  post "items/:item_id/evaluation", to: "evaluation#create"
  post "items/:id/favorite", to: "favorites#create"
  delete "items/:id/favorite", to: "favorites#destroy"
  
  get "users/:id/evaluation", to: "evaluation#index"
  post "users/:id/follow", to: "relationships#create"
  delete "users/:id/follow", to: "relationships#destroy"
  
  #出品一覧
  get "my_page/item", to: "my_pages#my_item"
  #購入一覧
  get "my_page/bought", to: "my_pages#bought"
  #フォロー一覧
  get "my_page/followings", to: "my_page#followings"
  #フォロワー一覧
  get "my_page/followers", to: "my_page#followers"
  #お気に入り一覧
  get "my_page/favorites", to: "my_page#favorites"

  #アイテムチャット
  post "items/:item_id/chats", to: "item_chats#create"
  delete "items/:item_id/chats/:id", to: "item_chats#destroy"
  get "items/:item_id/chats", to:"item_chats#index"
  get "items/:item_id/chats/:id", to:"item_chats#show"
  put "items/:item_id/chats/:id", to:"item_chats#update"
  #購入後のチャット
  post "items/:item_id/private_chats", to: "private_item_chats#create"
  get "items/:item_id/private_chats", to: "private_item_chats#index"

end
