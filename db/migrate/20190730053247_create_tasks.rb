class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :contents
      t.date :start
      t.date :dl
      t.string :type
      t.integer :prior
      t.integer :prog
      t.integer :qty

      t.timestamps
    end
  end
end
