class AddExpirationToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :expires_at, :datetime
  end
end
