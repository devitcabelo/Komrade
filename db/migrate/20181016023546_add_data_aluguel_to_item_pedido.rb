class AddDataAluguelToItemPedido < ActiveRecord::Migration[5.2]
  def change
    add_column :item_pedidos, :data_inicio, :date
    add_column :item_pedidos, :data_fim, :date
  end
end
