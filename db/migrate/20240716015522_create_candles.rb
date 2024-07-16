class CreateCandles < ActiveRecord::Migration[7.1]
  def change
    create_table :candles do |t|
      t.string :name
      t.boolean :lit

      t.timestamps
    end
  end
end
