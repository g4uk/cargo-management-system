Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'

  devise_for :company_owners
  devise_for :drivers
  devise_for :customers

  resources :companies
  resources :company_owners
  resources :customers
  resources :drivers
  resources :driver_licenses
  resources :goods
  resources :insurance_policies
  resources :orders
  resources :trailers

  post '/actions/take_order', to: 'drivers#take_order'
  get '/actions/new_driver_assignment', to: 'orders#new_driver_assignment'
  post 'actions/assign_driver', to: 'orders#assign_driver'

  get '/helpers/truck_select', to: 'trailers#truck_select'
  get '/helpers/driver_select', to: 'trucks#driver_select'
  resources :trucks

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
