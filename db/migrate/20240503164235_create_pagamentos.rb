class CreatePagamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :pagamentos do |t|
      t.string :status
      t.string :tipo
      t.integer :parcelas
      t.integer :valor_em_centavos
      t.string :identificador
      t.string :card_token

      t.timestamps
    end
  end
end
