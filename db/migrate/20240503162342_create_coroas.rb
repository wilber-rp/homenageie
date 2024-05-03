class CreateCoroas < ActiveRecord::Migration[7.1]
  def change
    create_table :coroas do |t|
      t.string :codigo
      t.string :descricao
      t.integer :preco_em_centavos

      t.timestamps
    end
  end
end
