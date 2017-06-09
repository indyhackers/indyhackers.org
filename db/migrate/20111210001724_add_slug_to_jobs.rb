class AddSlugToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :slug, :string
  end
end
