class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :company_name
      t.date :purchase_date
      t.integer :purchase_price

      t.timestamps
    end
  end
end
