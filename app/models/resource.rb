class Resource < ActiveRecord::Base
  validate :title, presence: true
  validate :url, presence: true
end
