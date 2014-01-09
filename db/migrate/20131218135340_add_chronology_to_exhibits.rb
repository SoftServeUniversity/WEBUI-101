class AddChronologyToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :chronology, :date
  end
end
