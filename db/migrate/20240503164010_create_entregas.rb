class CreateEntregas < ActiveRecord::Migration[7.1]
  def change
    create_table :entregas do |t|
      t.string :status

      t.timestamps
    end
  end
end
