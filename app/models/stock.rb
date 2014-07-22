class Stock < ActiveRecord::Base
  validate :ticker, :presence=> true
end
