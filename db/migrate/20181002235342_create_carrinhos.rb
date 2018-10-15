class CreateCarrinhos < ActiveRecord::Migration[5.2]
  def change
    create_table :carrinhos do |t|
      t.monetize :total

      t.timestamps
    end
  end
end
