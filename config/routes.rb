Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :customers, only: [:create] do
    resources :subscriptions, only: [:create, :update, :index, :edit]
  end
end
