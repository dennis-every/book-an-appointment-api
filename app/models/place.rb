class Place < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :owner, class_name: 'User'

  validates :name, presence: true
  validates :location, presence: true
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
