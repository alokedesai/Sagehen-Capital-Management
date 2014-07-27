class Resource < ActiveRecord::Base
  validate :title, presence: true
  validate :url, presence: true
  before_save :set_slideshare_html

  def set_slideshare_html
    return unless self.url.include? "slideshare"
    response = HTTParty.get("http://www.slideshare.net/api/oembed/2?url=#{self.url}&format=json")
    self.slideshare_html = response["html"] if response["html"].present?
  end
end
