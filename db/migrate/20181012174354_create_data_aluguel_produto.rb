class CreateDataAluguelProduto < ActiveRecord::Migration[5.2]
  def change
    create_table :data_aluguel_produtos do |t|
      t.date :data_inicio
      t.date :data_fim
      t.references :produto, foreign_key: true
      t.references :carrinho, foreign_key: true
      t.references :pedido, foreign_key: true
    end
  end
end
