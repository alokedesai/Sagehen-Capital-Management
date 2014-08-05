class AddPositionOrderToCurrentManagement < ActiveRecord::Migration
  def change
    add_column :current_managements, :position_order, :integer
  end
end
