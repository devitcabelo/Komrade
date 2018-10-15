class CreateItemPedido < ActiveRecord::Migration[5.2]
  def change
    create_table :item_pedidos do |t|
      t.references :item, foreign_key: true
      t.references :pedido, foreign_key: true
    end
  end
end
