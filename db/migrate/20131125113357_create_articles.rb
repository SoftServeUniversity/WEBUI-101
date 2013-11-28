class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :add_to_menu

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
