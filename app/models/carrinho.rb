class Carrinho < ApplicationRecord
  has_many :carrinho_produto
  has_many :produtos, through: :carrinho_produto

  monetize :total_cents

  before_save :calcula_total

  def produtos_agrupados
    self.produtos.group(:produto_id)
  end

  def datas_do produto
    self.carrinho_produto.find_by(produto_id: produto.id).data_inicio_e_fim_form
  end

  def quantidade_do produto
    self.carrinho_produto.find_by(produto_id: produto.id).quantidade
  end

  def atualizar params
    carrinho_produto = CarrinhoProduto.find_or_initialize_by(carrinho_id: self.id ,produto_id: params[:produto_id])
    carrinho_produto.quantidade = params[:quantidade]

    dates = CarrinhoProduto.split_begin_end(params[:data_aluguel_produto])
    carrinho_produto.data_inicio = dates[:begin]
    carrinho_produto.data_fim = dates[:end]

    {carrinho: self, carrinho_produto: carrinho_produto}
  end

  def calcula_total
    self.total = self.carrinho_produto.inject(0){|value, cp| (cp.produto.valor_locacao * cp.quantidade) + value}
  end
end
