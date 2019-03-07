Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit, :destroy]
      resources :ratings, except: [:index, :new, :edit]
      resources :friendships, only: [:index, :show, :create, :destroy]
      resources :messages, only: [:index, :show, :create]
      resources :chatrooms
      resources :chatroom_users, except: [:new, :edit]
      # post "/chatroom_users", to: 'chatroom_users#find_or_create_by'
      post "/login", to: "auth#login"
      get "/current_user", to: "auth#get_user_from_token"
    end
  end

  resources :champions, only: [:index, :show]
  resources :champion_users, only: [:index, :create]

  mount ActionCable.server => '/cable'

end
