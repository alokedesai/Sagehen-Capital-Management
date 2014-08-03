class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :ticker
      t.string :action
      t.text :thesis
      t.string :slideshare_url
      t.timestamps
    end
  end
end
