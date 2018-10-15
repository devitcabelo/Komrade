class AddDataAluguelToCarrinhoProduto < ActiveRecord::Migration[5.2]
  def change
    add_column :carrinho_produtos, :data_inicio, :date
    add_column :carrinho_produtos, :data_fim, :date
  end
end
