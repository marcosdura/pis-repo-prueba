class Company < ApplicationRecord
  has_many :admins
  has_many :consumers
  has_many :accounts, as: :owner
end
