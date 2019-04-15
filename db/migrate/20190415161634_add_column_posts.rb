class AddColumnPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :delivery_void_flag, :integer, default: 0, null: false, limit: 1
  end
end
