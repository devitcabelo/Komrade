class AddPerfilToPedido < ActiveRecord::Migration[5.2]
  def change
    add_reference :pedidos, :perfil, foreign_key: true
  end
end
