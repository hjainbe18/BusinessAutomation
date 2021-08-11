Rails.application.routes.draw do
  get 'welcome', to: 'welcome#index'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :customers
  resources :orders
  resources :users, only: %i[index edit update]

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'dashboard', to: 'dashboards#index'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
