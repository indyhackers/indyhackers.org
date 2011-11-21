class AddUserIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :user_id, :integer
  end
end
