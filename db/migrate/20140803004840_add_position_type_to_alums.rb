class AddPositionTypeToAlums < ActiveRecord::Migration
  def change
    add_column :alums, :position_type, :string
  end
end
