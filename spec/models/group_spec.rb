require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'has a valid factory bot' do
    expect(build(:group)).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(20) }
    it { is_expected.to validate_length_of(:description).is_at_most(255) }
  end
end
