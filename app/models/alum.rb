class Alum < ActiveRecord::Base
  validates :name, presence: true
  validates :grad_year, presence: true
  before_save :set_position_order
  before_save :add_http_to_linkedin

  validate :position_if_position_type
  def position_if_position_type
    errors.add("You must have both a position and position type") if position_held.present? ^ position_type.present?
  end

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
end
