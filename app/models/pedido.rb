class Pedido < ApplicationRecord
  # EXTENDS
  extend Enumerize

  # MAPS
  has_many :item_pedidos, dependent: :delete_all
  has_many :itens, through: :item_pedidos
  belongs_to :endereco

  # VALIDATES
  validates_presence_of :forma_pagamento

  monetize :total_cents

  # ENUM
  enumerize :forma_pagamento, in: ["Dinheiro"], predicates: false

  after_save :aluga_itens

  def datas_do item
    self.item_pedidos.find_by(item_id: item.id).data_inicio_e_fim_form
  end

  def self.gera_pedido_do_carrinho carrinho
    pedido = Pedido.new 
    pedido.itens = carrinho.itens_dos_produtos
    pedido.data = DateTime.now
    pedido.total = carrinho.total
    pedido.define_datas_itens(carrinho)
    pedido
  end

  def define_datas_itens carrinho
    self.item_pedidos.each do |item_pedido|
      carrinho.carrinho_produto.each do |carrinho_produto|
        if item_pedido.item.produto == carrinho_produto.produto
          item_pedido.data_inicio = carrinho_produto.data_inicio
          item_pedido.data_fim = carrinho_produto.data_fim
        end
      end
    end
  end

  def itens_agrupados
    itens.group_by(&:produto_id)
  end

  def aluga_itens
    Item.transaction do
      self.itens.each do |item|
        item.alugado = true
        item.save
      end
    end
  end

  def to_s
    primeiro_produto = self.itens_agrupados[1][0]
    segundo_produto = self.itens_agrupados[2][0]
    if segundo_produto.present?
      return id.to_s + ": " + primeiro_produto.produto_nome + ", " + segundo_produto.produto_nome + (self.itens_agrupados[3].present? ? "..." : "")
    else
      return id.to_s + ": " + primeiro_produto.produto_nome
    end
  end

end