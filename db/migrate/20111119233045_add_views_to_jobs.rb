class AddViewsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :views, :integer
  end
end
