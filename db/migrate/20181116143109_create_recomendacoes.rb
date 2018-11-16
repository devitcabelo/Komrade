class CreateRecomendacoes < ActiveRecord::Migration[5.2]
  def change
    create_table :recomendacoes do |t|
      t.references :perfil, foreign_key: true
      t.string :recomendacoes, default: "{}"

      t.timestamps
    end
  end
end
