class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :user_id, limit:10, default:'NULL'
      t.string :category_id, limit:10, default:'NULL'
      t.string :sub_category_id, limit:10, default:'NULL'
      t.string :title, limit:100, default:'NULL'
      t.string :slug, limit:100, default:'NULL'
      t.string :body, default:'NULL'
      t.string :image, default:'NULL'
      t.timestamps
    end

    add_index :posts, :slug
  end
end