class RemovePassFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :pass, :string
  end
end
