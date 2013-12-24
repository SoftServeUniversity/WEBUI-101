class ExhibitsBiographies < ActiveRecord::Migration
  def change
	create_table :biographies_exhibits  do |t|
      t.belongs_to :exhibit
      t.belongs_to :biography
    end  
  end
end

