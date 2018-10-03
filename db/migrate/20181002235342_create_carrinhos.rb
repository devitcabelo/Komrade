class CreateCarrinhos < ActiveRecord::Migration[5.2]
  def change
    create_table :carrinhos do |t|
      t.references :itens, foreign_key: true
      t.monetize :total

      t.timestamps
    end
  end
end
