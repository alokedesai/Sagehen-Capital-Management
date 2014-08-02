class Post < ActiveRecord::Base
  belongs_to :user
  validate :content_presence

  def readable_created_at
    self.created_at.strftime("%B %m, %Y")
  end

  def content_presence
    if type == "Presentation"
      errors.add(:ticker, "can't be blank") unless ticker
      errors.add(:thesis, "can't be blank") unless thesis
    else
      errors.add(:title, "can't be blank") unless title
      errors.add(:content, "can't be blank") unless content
    end
  end
end
