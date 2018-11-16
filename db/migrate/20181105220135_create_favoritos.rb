class CreateFavoritos < ActiveRecord::Migration[5.2]
  def change
    create_table :favoritos do |t|
      t.references :perfil, foreign_key: true
      t.references :produto, foreign_key: true

      t.timestamps
    end
  end
end
