class User < ApplicationRecord
  has_many :reservations
  has_many :places, through: :reservations

  validates :name, presence: true
end
