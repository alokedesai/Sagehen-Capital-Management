class AddExecutiveToAlums < ActiveRecord::Migration
  def change
    add_column :alums, :executive, :boolean, :default => true
  end
end
