class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :major
      t.string :access
      t.string :grad_year
      t.text :description
      t.string :linkedin_url
      t.string :title

      t.timestamps
    end
  end
end
