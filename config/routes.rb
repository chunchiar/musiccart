Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => '/cable'

  root to: 'landing#index'
  get :about, to: 'static_pages#about'
  get :cart, to: "carts#show"
  post :add_item, to: "carts#add_item"
  post :remove_item, to: "carts#remove_item"
  patch :update_item, to: "carts#update_item"

  resources :categories,only:[:index]
  resources :products,only:[:index,:new,:create,:edit,:destroy]
  resources :ordered_items, only:[:create, :update, :destroy]
  resources :checkouts, only: [:new, :create, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
              :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

end
