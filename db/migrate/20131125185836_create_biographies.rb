class CreateBiographies < ActiveRecord::Migration
  def change
    create_table :biographies do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
