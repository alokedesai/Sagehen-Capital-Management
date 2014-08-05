class CreateCurrentManagements < ActiveRecord::Migration
  def change
    create_table :current_managements do |t|
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
