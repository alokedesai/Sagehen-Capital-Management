class ChangeGradYearInAlums < ActiveRecord::Migration
  def change
    connection.execute(%q{
    alter table alums
    alter column grad_year
    type integer using cast(grad_year as integer)
  })
  end
end
