class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :body
      t.text :body_html
      t.string :title
      t.datetime :published_at
      t.string :slug

      t.timestamps
    end
  end
end
