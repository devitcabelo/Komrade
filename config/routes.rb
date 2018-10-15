Rails.application.routes.draw do
  resources :carrinhos, only: [:show, :edit, :destroy]
  resources :itens
  resources :produtos
  resources :carrinho_produtos

  get '/adicionar-no-carrinho/:produto_id', to: "carrinhos#adicionar_produto", as: :adicionar_produto

  devise_for :usuarios
  
  get '/carrinho', to: 'carrinhos#show', as: :carrinho_show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
