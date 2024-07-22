class AddRecipientToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :recipient, :string
  end
end
