Rails.application.routes.draw do

  root to: 'landing#index'
  get :about, to: 'static_pages#about'

  resources :categories,only:[:index]
  resources :products,only:[:index,:new,:create,:edit,:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
              :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

end
