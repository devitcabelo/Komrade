class CarrinhosController < ApplicationController
  # GET /carrinhos/1
  # GET /carrinhos/1.json
  def show
    @carrinho = current_cart
  end

  def adicionar_produto
    current_cart.adicionar_produto(params[:produto_id])
    flash[:notice] = "Adicionado com sucesso!"
    redirect_to request.referrer
  end

  def remover_produto
    current_cart.remover_produto(params[:produto_id])
    flash[:notice] = "Removido com sucesso!"
    redirect_to request.referrer
  end
end
