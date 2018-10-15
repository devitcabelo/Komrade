class CreateCarrinhoProduto < ActiveRecord::Migration[5.2]
  def change
    create_table :carrinho_produtos do |t|
      t.references :carrinho, foreign_key: true
      t.references :produto, foreign_key: true
    end
  end
end
