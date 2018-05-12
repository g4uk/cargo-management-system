Rails.application.routes.draw do
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
  resources :trucks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
