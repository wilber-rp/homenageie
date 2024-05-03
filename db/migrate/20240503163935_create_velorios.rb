class CreateVelorios < ActiveRecord::Migration[7.1]
  def change
    create_table :velorios do |t|
      t.string :nome
      t.string :cidade

      t.timestamps
    end
  end
end
