class AddUserIdToExhibitions < ActiveRecord::Migration
  def change
    add_reference :exhibitions, :user, index: true
  end
end
