class Menu < ApplicationRecord
  belongs_to :provider

  has_many :schedules
end
