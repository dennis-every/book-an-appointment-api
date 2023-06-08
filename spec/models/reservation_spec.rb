require 'rails_helper'

describe Reservation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:customer).class_name('User') }
    it { is_expected.to belong_to(:place) }
  end
  describe 'validations' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:bill) }
    it { should validate_numericality_of(:bill).is_greater_than_or_equal_to(0) }

    it 'validates end_date is after start_date' do
      Reservation.destroy_all
      Place.destroy_all
      User.destroy_all

      user = User.create!(name: 'John')
      place = Place.create!(name: 'La casa escondida', location: 'Peru', owner: user, rate: 200)
      reservation = Reservation.new(start_date: '31/12/2022', end_date: '31/12/2023', place:, customer: user, bill: 200)
      expect(reservation).to be_valid

      reservation.end_date = reservation.start_date - 30.days
      expect(reservation).to_not be_valid
    end
  end
end
