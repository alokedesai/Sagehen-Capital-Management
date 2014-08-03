class AddPositionOrderToAlums < ActiveRecord::Migration
  def change
    add_column :users, :position_order, :integer
  end
end
