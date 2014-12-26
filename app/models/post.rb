class Post < ActiveRecord::Base
  belongs_to :user
  validate :content_presence
  before_save :set_slideshare_html

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

  def set_slideshare_html
    return unless self.slideshare_url.present? && self.slideshare_url.include?("slideshare") && self.slideshare_url_changed?
    response = HTTParty.get("http://www.slideshare.net/api/oembed/2?url=#{self.slideshare_url}&format=json")
    self.slideshare_html = response["html"] if response["html"].present?
  end
end
