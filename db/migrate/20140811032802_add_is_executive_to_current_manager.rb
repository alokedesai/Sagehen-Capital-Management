class AddIsExecutiveToCurrentManager < ActiveRecord::Migration
  def change
    add_column :current_managers, :executive, :boolean
  end
end
