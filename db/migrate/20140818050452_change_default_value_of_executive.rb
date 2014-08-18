class ChangeDefaultValueOfExecutive < ActiveRecord::Migration
  def change
    change_column_default :alums, :executive, nil
  end
end
