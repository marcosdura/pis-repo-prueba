class CreateNotificationConfigurations < ActiveRecord::Migration[7.2]
  def change
    create_table :notification_configurations do |t|
      t.string :description

      t.timestamps
    end
  end
end
