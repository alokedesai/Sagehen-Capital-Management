class AddSlideshareHtmlToResources < ActiveRecord::Migration
  def change
    add_column :resources, :slideshare_html, :text
  end
end
