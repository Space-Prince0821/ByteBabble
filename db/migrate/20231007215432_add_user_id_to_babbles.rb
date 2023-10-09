class AddUserIdToBabbles < ActiveRecord::Migration[7.0]
  def change
    add_column :babbles, :user_id, :integer
  end
end
