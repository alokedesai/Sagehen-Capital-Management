class Alum < ActiveRecord::Base
  validates :name, presence: true
  validates :grad_year, presence: true
  before_save :set_position_order
  before_save :add_http_to_linkedin
  before_save :set_executive

  EXECUTIVES = ["Chief Executive Officer", "Chief Operating Officer", "Chief Investment Officer",
  "Chief Technology Officer"]
  GROUP_LEADERS = ["Director of Equities", "Director of Global Macro",
  "Director of Market Neutral", "Head of Emerging Markets", "Head of Developed Markets",
  "Head of Research"]

  private
  def set_position_order
    return unless position_held.present?
    case position_held
    when "Chief Executive Officer"
      self.position_order = 1
    when "Chief Operating Officer"
      self.position_order = 2
    when "Chief Investment Officer"
      self.position_order = 3
    else
      self.position_order = 4
    end
  end

  def add_http_to_linkedin
    return unless linkedin_url.start_with? "http"
    linkedin_url.prepend "http://"
  end

  def set_executive
    return unless position_held_changed?
    self.executive = position_held.in? EXECUTIVES
    true
  end
end
