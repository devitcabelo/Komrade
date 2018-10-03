Rails.application.routes.draw do
  resources :carrinhos
  resources :itens
  resources :produtos
  devise_for :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
