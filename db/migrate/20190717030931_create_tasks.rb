class CreateTasks < ActiveRecord::Migration[5.2]
  def up
    create_table :tasks do |t|
      t.string :name
      t.text :contents
      t.date :deadline
      t.integer :priority
      t.integer :status
      
      t.timestamps
    end
  end
end
