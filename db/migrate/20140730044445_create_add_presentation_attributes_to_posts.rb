class CreateAddPresentationAttributesToPosts < ActiveRecord::Migration
  def change
    create_table :add_presentation_attributes_to_posts do |t|

      t.timestamps
    end
  end
end
