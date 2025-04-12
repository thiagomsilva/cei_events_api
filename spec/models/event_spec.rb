require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:date) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:capacity).only_integer.is_greater_than(0) }
  end

  describe 'associations' do
    it { should have_many(:registrations) }
    it { should have_many(:users).through(:registrations) }
  end
end
