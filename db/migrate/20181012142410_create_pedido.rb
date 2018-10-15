class CreatePedido < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.monetize :total
      t.integer :forma_pagamento
    end
  end
end
