Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index


  root "public_recipes#index"
  resources :foods, only: [:index, :destroy, :create, :new]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update]
  end
  resources :general_shopping_list, only: [:index]
  resources :public_recipes, only: [:index]
end
