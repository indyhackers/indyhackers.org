class DeviseCreateAdmins < ActiveRecord::Migration[5.1]
  def self.up
    create_table(:admins) do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.integer  :failed_attempts, default: 0, null: false
      t.string   :unlock_token
      t.datetime :locked_at

      t.timestamps
    end

    add_index :admins, :email,                :unique => true
  end

  def self.down
    drop_table :admins
  end
end
