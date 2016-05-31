class AddUsertoFav < ActiveRecord::Migration
  def change
    add_column :favorites, :user_id, :string
  end
end
