class RenameSlugOnJobs < ActiveRecord::Migration[5.1]
  def up
    rename_column :jobs, :slug, :cached_slug
    add_index :jobs, :cached_slug
  end
end
