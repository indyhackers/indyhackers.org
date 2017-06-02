class AddViewsToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :views, :integer
  end
end
