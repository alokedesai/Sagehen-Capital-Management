class CreateAlums < ActiveRecord::Migration
  def change
    create_table :alums do |t|
      t.string :linkedin_url
      t.string :grad_year
      t.string :position_held
      t.string :job_title
      t.string :company
      t.string :location
      t.text :bio

      t.timestamps
    end
  end
end
