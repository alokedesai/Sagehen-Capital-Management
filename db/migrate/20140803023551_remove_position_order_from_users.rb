class RemovePositionOrderFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :position_order
    add_column :alums, :position_order, :integer
  end
end
