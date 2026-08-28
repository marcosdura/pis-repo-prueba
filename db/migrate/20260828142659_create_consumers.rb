class CreateConsumers < ActiveRecord::Migration[7.2]
  def change
    create_table :consumers do |t|
      t.string :email
      t.string :username
      t.string :address
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
    add_index :consumers, :email, unique: true
  end
end
