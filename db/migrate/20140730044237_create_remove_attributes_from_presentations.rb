class CreateRemoveAttributesFromPresentations < ActiveRecord::Migration
  def change
    create_table :remove_attributes_from_presentations do |t|

      t.timestamps
    end
  end
end
