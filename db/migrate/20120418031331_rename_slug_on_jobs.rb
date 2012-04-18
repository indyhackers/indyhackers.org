class RenameSlugOnJobs < ActiveRecord::Migration
  def up
    rename_column :jobs, :slug, :cached_slug
    add_index :jobs, :cached_slug
  end
end
