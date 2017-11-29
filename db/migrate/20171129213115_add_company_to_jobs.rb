class AddCompanyToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :company, :string
  end
end
