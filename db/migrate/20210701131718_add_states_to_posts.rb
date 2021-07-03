class AddStatesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :states, :string
  end
end
