class Account < ApplicationRecord
  belongs_to :payment
  belongs_to :owner, polymorphic: true
end
