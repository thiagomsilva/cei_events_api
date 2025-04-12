require 'rails_helper'

RSpec.describe Registration, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:status) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end
end
