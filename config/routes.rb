Rails.application.routes.draw do
  root 'stories#index'
  resources :plot_points
  resources :characters
  resources :stories
  resources :users, only: [:create, :show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
