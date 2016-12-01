class AddNamedRedirects < ActiveRecord::Migration
  def up
    create_table(:redirects, :id => false) do |t|
      t.column :id,  :string, limit: 255, null: false
      t.column :url, :string, limit: 255
      t.column :last_visited_at, :datetime
      t.column :visits, :integer, null: false, default: 0
      t.timestamps
    end
    execute "ALTER TABLE redirects ADD PRIMARY KEY (id)"
  end

  def down
    drop_table :redirects
  end
end
