require 'rails_helper'

RSpec.describe Member, type: :model do
  it 'has a valid factory bot' do
    expect(build(:member)).to be_valid
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:group_id) }
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:group_id) }
  end
end
