class CarrinhoProdutosController < ApplicationController
  before_action :set_carrinho, only: [:show, :edit, :update, :destroy]

  # GET /carrinhos
  # GET /carrinhos.json
  def index
    @produtos_carrinhos = current_cart.produtos
  end

  def create
    @carrinho = current_cart
    retorno = @carrinho.atualizar(carrinho_produto_params)
    @carrinho_produto = retorno[:carrinho_produto]
    @carrinho = retorno[:carrinho]

    @carrinho_produto.save
    @carrinho.save
    session[:carrinho_id] = @carrinho.id
    redirect_to carrinho_show_path
  end

  def update
    @carrinho = current_cart
    retorno = @carrinho.atualizar(carrinho_produto_params)
    @carrinho_produto = retorno[:carrinho_produto]
    @carrinho = retorno[:carrinho]

    @carrinho_produto.save
    @carrinho.save
    session[:carrinho_id] = @carrinho.id
    redirect_to carrinho_show_path
  end

  def destroy
    @carrinho = current_cart
    @carrinho_produto = @carrinho.produtos.find(params[:id])
    @carrinho_produto.destroy
    @carrinho_produtos = @carrinho.produtos
  end
  
  private
  
  def carrinho_produto_params
    params.require(:carrinho_produto).permit(:produto_id, :quantidade, :data_aluguel_produto)
  end
  
  # Use callbacks to share common setup or constraints between actions.
  def set_carrinho
    @carrinho = Carrinho.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def carrinho_params
    params.require(:carrinho).permit(:produtos_id, :total)
  end
  
end