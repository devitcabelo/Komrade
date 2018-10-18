class AddEnderecoToPedido < ActiveRecord::Migration[5.2]
  def change
    add_reference :pedidos, :endereco, foreign_key: true
  end
end
