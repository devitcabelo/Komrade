class PedidosController < ApplicationController
  def new
    @pedido = Pedido.gera_pedido_do_carrinho(current_cart)
  end 

  def create

  end
end
