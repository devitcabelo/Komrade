class Pedido < ApplicationRecord
  has_many :item_pedidos
  has_many :itens, through: :item_pedidos
end