class AddQuantidadeToCarrinhoProduto < ActiveRecord::Migration[5.2]
  def change
    add_column :carrinho_produtos, :quantidade, :integer
  end
end
