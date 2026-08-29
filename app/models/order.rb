class Order < ApplicationRecord
  belongs_to :meal

  STATUSES = %w[pending cancelled].freeze

  validates :employee_name, presence: true
  validates :delivery_date, presence: true
  validates :status, inclusion: { in: STATUSES }

  def pending?
    status == "pending"
  end

  def cancel
    return false unless pending?

    update(status: "cancelled")
  end
end


