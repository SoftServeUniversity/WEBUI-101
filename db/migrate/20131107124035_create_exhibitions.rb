class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :adress
      t.float :latitude
      t.float :longitude
      t.boolean :virtual

      t.timestamps
    end
  end
end
