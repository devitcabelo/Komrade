class ApplicationController < ActionController::Base
  #before_action :authenticate_usuario!
  protect_from_forgery with: :exception
  helper_method :current_cart, :can_control

  def can_control
  end

  def current_cart
    if session[:carrinho_id].present?
      Carrinho.find(session[:carrinho_id])
    else
      carrinho = Carrinho.create
      session[:carrinho_id] = carrinho.id
      carrinho
    end
  end
end
