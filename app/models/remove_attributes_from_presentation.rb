class RemoveAttributesFromPresentation < ActiveRecord::Base
  remove_column :presentations, :ticker
  remove_column :presentations, :action
  remove_column :presentations, :thesis
  remove_column :presentations, :slideshare_url
end
