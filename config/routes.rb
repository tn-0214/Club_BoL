Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  get "items/itemlist"
  get "items/searchbranch"

  get "items/searchbranch"
  get "items/search_legion"
  get "items/search_category"

  resources :items do
   resources :orders, only: [:index, :create]
   collection do get 'search'
   end
  end
  resources :users, only: :show
end
