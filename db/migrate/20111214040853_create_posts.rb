class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :body
      t.text :body_html
      t.string :title
      t.datetime :published_at
      t.string :slug

      t.timestamps
    end
  end
end
