class CreateBiographiesTagsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :biographies, :tags do |t|
      t.index [:biography_id, :tag_id]
    end
  end
end
