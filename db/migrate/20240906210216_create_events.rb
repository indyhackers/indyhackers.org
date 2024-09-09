class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :location
      t.text :organizer
      t.text :photo
      t.text :recurrence
      t.timestamps
    end
  end
end
