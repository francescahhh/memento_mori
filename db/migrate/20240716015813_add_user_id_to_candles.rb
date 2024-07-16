class AddUserIdToCandles < ActiveRecord::Migration[7.1]
  def change
    add_column :candles, :user_id, :integer
  end
end
