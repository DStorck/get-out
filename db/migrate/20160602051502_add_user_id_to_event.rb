class AddUserIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :string
    rename_column :events, :when, :start_time
  end
end
