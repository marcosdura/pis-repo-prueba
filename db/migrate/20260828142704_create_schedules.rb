class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.time :deadline
      t.integer :amount
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
