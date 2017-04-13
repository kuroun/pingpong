class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :player_one
      t.integer :player_two
      t.date :played_date
      t.integer :player_one_score
      t.integer :player_two_score

      t.timestamps null: false
    end
    add_index :logs, [:player_one, :player_two]
  end
end
