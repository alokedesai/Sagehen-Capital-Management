class StaticPagesController < ApplicationController
  def overview
  end

  def mission
  end

  def investment_philosophy
  end

  def alumni
    @alums_by_year = []
    years = Alum.pluck(:grad_year).uniq.sort{|a,b| b <=> a}
    years.each do |year|
      @alums_by_year << Alum.where(:grad_year=> year).where("position_held is NOT NULL").order("executive DESC, position_order ASC")
    end
    @alums_by_year
  end

  def current_management
    @managers = CurrentManager.order("executive DESC, position_order ASC, is_vp DESC")
  end
end
