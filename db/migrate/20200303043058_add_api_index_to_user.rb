class AddApiIndexToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :api_key, unique: true
  end
end
