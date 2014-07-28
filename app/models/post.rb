class Post < ActiveRecord::Base
  belongs_to :user
  validate :user_id, :presence=> true
  validate :title, :presence=> true
  validate :content, :presence=> true

  def readable_created_at
    self.created_at.strftime("%B %m, %Y")
  end
end
