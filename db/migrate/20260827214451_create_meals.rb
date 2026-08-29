class CreateMeals < ActiveRecord::Migration[7.2]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.boolean :available, null: false, default: true

      t.timestamps
    end
  end
end



