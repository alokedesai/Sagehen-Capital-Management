class AddSlideshareUrlToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :slideshare_url, :string
  end
end
