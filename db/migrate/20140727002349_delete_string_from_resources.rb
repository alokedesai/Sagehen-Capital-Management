class DeleteStringFromResources < ActiveRecord::Migration
  def change
    remove_column :resources, :string
  end
end
