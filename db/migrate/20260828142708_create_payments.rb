class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
