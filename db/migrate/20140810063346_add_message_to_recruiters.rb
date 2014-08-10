class AddMessageToRecruiters < ActiveRecord::Migration
  def change
    add_column :recruiters, :message, :text
    remove_column :recruiters, :interest
  end
end
