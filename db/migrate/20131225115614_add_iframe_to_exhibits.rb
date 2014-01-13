class AddIframeToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :iframe, :text
  end
end
