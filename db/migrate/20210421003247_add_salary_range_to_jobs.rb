class AddSalaryRangeToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :salary, :string
  end
end
