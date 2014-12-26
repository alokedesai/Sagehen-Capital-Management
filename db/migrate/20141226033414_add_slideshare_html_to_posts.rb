class AddSlideshareHtmlToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :slideshare_html, :text
  end
end
