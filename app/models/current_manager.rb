class CurrentManager < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :user_id, presence: true

  before_save :set_position_order
  before_save :set_executive

  EXECUTIVES = ["Chief Executive Officer", "Chief Operating Officer", "Chief Investment Officer",
  "Chief Technology Officer"]
  GROUP_LEADERS = ["Director of Equities", "Director of Global Macro",
  "Director of Market Neutral", "Head of Emerging Markets", "Head of Developed Markets",
  "Head of Research"]

  private
  def set_position_order
    return unless title_changed?
    case title
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

  def set_executive
    return unless title_changed?
    self.executive = title.in? EXECUTIVES
    true
  end
end
