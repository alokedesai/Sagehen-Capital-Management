class RemoveApprovedDefaultInUsers < ActiveRecord::Migration
  def change
  	change_column_default :users, :approved, nil
  end
end
