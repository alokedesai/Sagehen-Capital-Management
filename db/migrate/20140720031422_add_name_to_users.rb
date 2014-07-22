class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :alums, :name, :string
  end
end
