class Reservation < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :place

  validates :start_date, presence: true
  validates :end_date, presence: true
  before_validation :set_bill

  validates :bill, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :end_date_after_start_date
  validate :start_date_cannot_be_in_the_past, on: :create

  private

  def set_bill
    return unless start_date && end_date && place

    self.bill = (end_date - start_date).to_i * place.rate
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, 'must be after start date') if end_date <= start_date
  end

  def start_date_cannot_be_in_the_past
    return if start_date.blank?

    errors.add(:start_date, "can't be in the past") if start_date < Date.today + 1.day
  end
end
