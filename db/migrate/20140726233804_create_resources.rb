class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :string
      t.string :url
      t.string :string

      t.timestamps
    end
  end
end
