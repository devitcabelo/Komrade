class ChangeTipoToString < ActiveRecord::Migration[5.2]
  def change
    change_column :produtos, :tipo, :string
  end
end
