class AddAvatarToUsers < ActiveRecord::Migration[5.0]
  def up
    add_attachment :users, :avatar
    remove_column :users, :headshot
  end
  def down
    remove_attachment :users, :avatar
    add_column :users, :headshot, limit: 255
  end
end
