class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.string :name
      t.string :registration_number
      t.date :date_of_receipt
      t.string :fund_creator
      t.string :opportunity_for_transportation
      t.string :the_degree_of_preservation
      t.boolean :authenticity
      t.boolean :the_electronic_version
      t.string :size
      t.text :description

      t.timestamps
    end
  end
end
