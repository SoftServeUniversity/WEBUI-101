class CreateMarkdownImages < ActiveRecord::Migration
  def change
    create_table :markdown_images do |t|
      t.string :image

      t.timestamps
    end
  end
end
