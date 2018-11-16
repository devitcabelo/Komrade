Rails.application.routes.draw do
  resources :enderecos
  resources :perfis, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :carrinhos, only: [:show, :edit, :destroy]
  resources :itens
  resources :produtos
  resources :carrinho_produtos
  resources :pedidos
  resources :favoritos, only: [:index, :create, :destroy]
  resources :lista_desejos, only: [:index, :create, :destroy]

  get '/adicionar-no-carrinho/:produto_id', to: "carrinhos#adicionar_produto", as: :adicionar_produto

  devise_for :usuarios
  
  get '/carrinho', to: 'carrinhos#show', as: :carrinho_show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
