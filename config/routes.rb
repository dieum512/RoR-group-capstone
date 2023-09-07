Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :foods, only: [:index, :destroy, :create, :new, :create]
  resources :recipes, only: [:index, :show]
  resources :general_shopping_list, only: [:index]
end
