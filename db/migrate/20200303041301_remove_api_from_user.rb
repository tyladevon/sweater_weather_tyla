class RemoveApiFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :api
  end
end
