class AddUserIdToExhibits < ActiveRecord::Migration
  def change
    add_reference :exhibits, :user, index: true
  end
end
