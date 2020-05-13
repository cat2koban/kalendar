require 'rails_helper'

RSpec.describe Member, type: :model do
  it 'has a valid factory bot' do
    expect(build(:member)).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:group_id) }

    describe 'uniqueness validation' do
      it do
        user = create(:user)
        group = create(:group)
        other_user = create(:user)
        other_group = create(:group)
        create(:member, user: user, group: group)

        expect(build(:member, user: user, group: other_group)).to be_valid
        expect(build(:member, user: other_user, group: group)).to be_valid
        expect(build(:member, user: user, group: group)).to be_invalid
      end
    end
  end
end
