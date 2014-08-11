class CurrentManager < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :user_id, presence: true

  before_save :set_position_order

  private
  def set_position_order
    return unless position_order.present? and position_order_changed?
    case position_order
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

end
