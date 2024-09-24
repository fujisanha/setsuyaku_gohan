class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :income
      t.integer :expense
      t.datetime :start_time

      t.timestamps
    end
  end
end
