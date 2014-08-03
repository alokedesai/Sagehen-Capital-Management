class AddTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :type, :string
    remove_column  :posts, :ticker
  end
end
