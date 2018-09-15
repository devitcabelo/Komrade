class CreateProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.monetize :valor_locacao 
      t.float :nota
      t.string :plataforma
      t.string :genero
      t.string :estudio
      t.integer :idade_recomendada
      t.date :data_lancamento
      t.string :resolucao_maxima
      t.integer :tipo

      t.timestamps
    end
  end
end
