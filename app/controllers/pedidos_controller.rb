class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  def index
    @pedidos = perfil.pedidos
  end

  def new
    @pedido = Pedido.gera_pedido_do_carrinho(current_cart)
    @carrinho = current_cart
    @enderecos = perfil.enderecos
    if @enderecos.empty?
      flash[:notice] = "Opa! Antes de finalizar seu pedido você precisa cadastrar um endereço para entrega."
      session[:go_back_to_url] = new_pedido_path
      redirect_to new_endereco_path
    end
  end 

  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.itens = current_cart.itens_dos_produtos
    @pedido.total = current_cart.total
    @pedido.perfil_id = perfil.id
    if @pedido.save
      esvaziar_carrinho
      redirect_to pedido_path(@pedido)
    else
      @carrinho = current_cart
      @enderecos = perfil.enderecos
      render :edit
    end
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end
    
    def pedido_params
      params.require(:pedido).permit(:forma_pagamento, :endereco_id)
    end
end
