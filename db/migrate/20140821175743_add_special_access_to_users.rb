class AddSpecialAccessToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :special_access, :boolean, :default => false
  end
end
