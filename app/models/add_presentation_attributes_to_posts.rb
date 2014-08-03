class AddPresentationAttributesToPosts < ActiveRecord::Base
  def change
    add_column :presentations, :ticker, :string
    add_column :presentations, :action, :string
    add_column :presentations, :thesis, :string
    add_column :presentations, :slideshare_url, :string
  end
end
