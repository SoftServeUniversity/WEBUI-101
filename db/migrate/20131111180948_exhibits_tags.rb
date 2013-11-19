class ExhibitsTags < ActiveRecord::Migration
  def change
    create_table :exhibits_tags do |t|
      t.belongs_to :exhibit
      t.belongs_to :tag
    end
  end
end
