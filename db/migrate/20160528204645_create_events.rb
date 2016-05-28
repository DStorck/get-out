class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :uid
      t.string :location
      t.string :url
      t.string :description
      t.datetime :when
      t.string :venue

      t.timestamps null: false
    end
  end
end
