class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :estado
      t.string :cidade
      t.string :bairro
      t.string :logradouro
      t.string :complemento
      t.string :numero
      t.string :responsavel
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
