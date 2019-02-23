class AddColumnPost < ActiveRecord::Migration[5.2]
  def up
    add_column :posts, :title, :string
    add_column :posts, :url, :string
  end
end
