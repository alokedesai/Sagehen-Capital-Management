class AddShareCountToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :share_count, :integer
  end
end
