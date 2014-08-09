class AboutController < ApplicationController
  def index
  end

  def mission
  end

  def investment_philosophy
  end

  def alumni
    @alums_by_year = []
    years = Alum.pluck(:grad_year).uniq.sort{|a,b| b.length <=> a.length}
    years.each do |year|
      @alums_by_year << Alum.where(:grad_year=> year).where("position_held is NOT NULL").order("position_order DESC")
    end
    @alums_by_year
  end

end
