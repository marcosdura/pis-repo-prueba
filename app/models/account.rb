class Account < ApplicationRecord
  has_one :payment
  belongs_to :owner, polymorphic: true
end
