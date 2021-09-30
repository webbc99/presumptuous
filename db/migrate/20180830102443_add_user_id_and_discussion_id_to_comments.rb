class AddUserIdAndDiscussionIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :discussion_id, :integer
    add_index :comments, :user_id
    add_index :comments, :discussion_id
  end
end
