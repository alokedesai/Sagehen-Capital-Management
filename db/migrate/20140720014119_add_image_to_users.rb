class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string
    add_column :users, :linkedin_id, :string
  end
end
