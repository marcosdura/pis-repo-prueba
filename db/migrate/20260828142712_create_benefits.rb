class CreateBenefits < ActiveRecord::Migration[7.2]
  def change
    create_table :benefits do |t|
      t.integer :amount
      t.string :description
      t.integer :percentage
      t.date :due_date
      t.references :consumer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
