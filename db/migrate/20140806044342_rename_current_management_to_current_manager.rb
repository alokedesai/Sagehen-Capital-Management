class RenameCurrentManagementToCurrentManager < ActiveRecord::Migration
  def change
    rename_table :current_managements, :current_managers
  end
end
