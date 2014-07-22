class Alum < ActiveRecord::Base
  validate :name, presence: true
  validate :grad_year, presence: true
  validate :position_held, presence: true
end
