class CreatePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedidos do |t|
      t.string :nome_falecido
      t.date :data_velorio
      t.date :hora_velorio
      t.string :faixa
      t.references :coroa, null: false, foreign_key: true
      t.references :velorio, null: false, foreign_key: true
      t.references :pagamento, null: false, foreign_key: true
      t.references :entrega, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
