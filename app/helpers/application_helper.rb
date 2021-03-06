module ApplicationHelper
  # generates all possible years starting from the SCM creation to today's year for select fields
  def possible_years
    result = []
    current_year = Time.now.year
    (2007.. (current_year+4)).to_a.each do |year|
      result << [year, year]
    end
    result
  end
end
