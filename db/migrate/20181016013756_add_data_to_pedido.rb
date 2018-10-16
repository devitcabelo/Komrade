class AddDataToPedido < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidos, :data, :datetime
  end
end
