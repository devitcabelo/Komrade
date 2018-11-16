class CreateListaDesejos < ActiveRecord::Migration[5.2]
  def change
    create_table :lista_desejos do |t|
      t.references :produto, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
