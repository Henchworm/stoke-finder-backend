Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#welcome'
  namespace :api do
    namespace :v1 do
      post '/sessions/auth', to: "sessions#auth"
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create]
      resources :adventures, only: [:create, :update]
    end
  end
end
