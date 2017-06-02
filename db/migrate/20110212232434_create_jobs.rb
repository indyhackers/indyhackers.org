class CreateJobs < ActiveRecord::Migration[5.1]
  def self.up
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
