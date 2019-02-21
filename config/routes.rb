Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit, :destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :ratings, except: [:index, :new, :edit]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :friendships, only: [:show, :create, :destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:show, :create]
    end
  end

end
