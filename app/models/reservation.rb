class Reservation < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :place

  before_validation :set_bill

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :bill, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :end_date_after_start_date

  private

  def set_bill
    self.bill = (end_date - start_date).to_i * place.rate
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, 'must be after start date') if end_date <= start_date
  end
end
