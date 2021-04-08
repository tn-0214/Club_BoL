Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  get "items/itemlist"
  get "items/searchbranch"

  resources :items do
   resources :orders, only: [:index, :create]
   collection do get 'search'
   end
  end
end
