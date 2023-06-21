require 'rails_helper'

describe Place, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:reservations) }
    it { is_expected.to belong_to(:owner).class_name('User') }
  end
  describe 'validations' do
    Place.destroy_all
    User.destroy_all
    user = User.create!(name: 'John')
    Place.create!(description: 'John - Photographer', location: 'Peru', owner: user, rate: 200)

    it { is_expected.to validate_presence_of(:description) }
  end
end
