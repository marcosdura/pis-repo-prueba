class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :meal, null: false, foreign_key: true

      t.string :employee_name, null: false
      t.date :delivery_date, null: false
      t.string :status, null: false, default: "pending"

      t.timestamps
    end
  end
end
