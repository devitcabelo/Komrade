class CreateItens < ActiveRecord::Migration[5.2]
  def change
    create_table :itens do |t|
      t.references :produto, foreign_key: true
      t.string :codigo
      t.boolean :alugado, default: false

      t.timestamps
    end
  end
end
