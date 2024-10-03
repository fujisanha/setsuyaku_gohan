class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :income, null: false, default: 0
      t.integer :expense, null: false, default: 0
      t.datetime :start_time, null: false

      t.timestamps
    end
  end
end
