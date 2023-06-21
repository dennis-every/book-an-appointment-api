class User < ApplicationRecord
  has_many :reservations, foreign_key: :customer_id, dependent: :destroy
  has_many :places, through: :reservations

  validates :name, presence: true, uniqueness: true
end
