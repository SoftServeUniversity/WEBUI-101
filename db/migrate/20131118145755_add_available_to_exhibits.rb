class AddAvailableToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :available, :boolean, default: true
  end
end
