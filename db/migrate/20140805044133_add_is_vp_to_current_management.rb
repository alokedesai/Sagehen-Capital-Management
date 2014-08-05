class AddIsVpToCurrentManagement < ActiveRecord::Migration
  def change
    add_column :current_managements, :is_vp, :boolean
  end
end
