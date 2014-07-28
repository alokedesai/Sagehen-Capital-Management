class Post < ActiveRecord::Base
  belongs_to :user
  validate :user_id, :presence=> true
  validate :title, :presence=> true
  validate :content, :presence=> true

end
