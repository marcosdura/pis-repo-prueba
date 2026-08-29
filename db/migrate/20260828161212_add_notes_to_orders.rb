class AddNotesToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :notes, :text
  end
end
