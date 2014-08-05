class AddCurrentManagementToAlumni < ActiveRecord::Migration
  def change
    add_column :alums, :current_management, :boolean, default: true
  end
end
