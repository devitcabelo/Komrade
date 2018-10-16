class CreatePerfis < ActiveRecord::Migration[5.2]
  def change
    create_table :perfis do |t|
      t.references :usuario, foreign_key: true
      t.string :nome
      t.string :sobrenome
      t.string :cpf
      t.string :celular
      t.string :data_nascimento
      t.integer :tipo

      t.timestamps
    end
  end
end
