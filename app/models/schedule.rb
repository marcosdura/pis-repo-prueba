class Schedule < ApplicationRecord
  belongs_to :menu
  has_many :orders
end
