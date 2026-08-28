class Consumer < ApplicationRecord
  belongs_to :company

  has_many :orders
  has_many :benefits
  has_many :accounts, as: :owner
  has_many :user_notifications, as: :user
  has_many :notification_configurations, through: :user_notifications, source: :notification_configuration
end
