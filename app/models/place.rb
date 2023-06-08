class Place < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :owner, class_name: 'User'
end
