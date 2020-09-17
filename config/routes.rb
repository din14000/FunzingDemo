Rails.application.routes.draw do
  get 'about', to: 'pages#about'

  root 'pages#about'

  resources :orders do
    resources :activities
  end

  resources :activities do
    resources :orders
  end


  controller :orders do
    post 'orders/new' => 'orders#new'
  end

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
