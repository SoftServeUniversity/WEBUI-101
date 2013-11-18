class CreateExhibitionsExhibits < ActiveRecord::Migration
  def change
    create_table :exhibitions_exhibits, index: false do |t|
      t.references :exhibition, index: true
      t.references :exhibit, index: true
    end
  end
end
