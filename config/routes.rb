Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      root to: 'welcome#welcome'
      resources :users, only: [:show]
    end
  end
end
