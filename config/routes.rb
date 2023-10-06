Rails.application.routes.draw do
  resources :babbles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "babbles#index"
end
