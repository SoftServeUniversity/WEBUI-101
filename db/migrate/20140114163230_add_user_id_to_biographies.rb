class AddUserIdToBiographies < ActiveRecord::Migration
  def change
    add_column :biographies, :user_id, :integer
  end
end
