require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory bot' do
    expect(build(:user)).to be_valid
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it do
      is_expected.to allow_values('first.last@foo.jp',
                                  'user@example.com',
                                  'USER@foo.COM',
                                  'A_US-ER@foo.bar.org',
                                  'alice+bob@baz.cn').for(:email)
    end
    it do
      is_expected.to_not allow_values('user@example,com',
                                      'user_at_foo.org',
                                      'user.name@example.',
                                      'foo@bar_baz.com',
                                      'foo@bar+baz.com').for(:email)
    end

    describe 'validate uniqueness of email' do
      let!(:user) { create(:user, email: 'user@example.com') }
      it 'is invalid with a duplicate email' do
        user = build(:user, email: 'user@example.com')
        expect(user).to_not be_valid
      end
      it 'is case insensitive in email' do
        user = build(:user, email: 'USER@EXAMPLE.COM')
        expect(user).to_not be_valid
      end
    end

    describe 'validate presence of password' do
      it 'is invalid with a blank password' do
        user = build(:user, password: ' ' * 6)
        expect(user).to_not be_valid
      end
    end
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  describe 'has_many' do
    it { should have_many(:tasks) }
    it { should have_many(:members) }
    it { should have_many(:groups) }
  end

  describe 'before_save' do
    describe '#email_downcase' do
      let!(:user) { create(:user, email: 'USER@EXAMPLE.COM') }
      it 'makes email from up to low case' do
        expect(user.reload.email).to eq 'user@example.com'
      end
      it 'makes email from mix to low case' do
        user = create(:user, email: 'MixIN@ExamPle.com')
        expect(user.reload.email).to eq 'mixin@example.com'
      end
      it 'makes email no changes' do
        user = create(:user, email: 'downcase@example.com')
        expect(user.reload.email).to eq 'downcase@example.com'
      end
    end
  end

  describe '#joined_group_members' do
    let(:user) { create(:user) }
    let(:group_1) { create(:group) }
    let(:group_2) { create(:group) }
    let(:user_2) { create(:user, name: 'user_2') }
    let(:user_3) { create(:user, name: 'user_3') }
    let(:members) { user.send(:joined_group_members) }

    it 'returns a list of users.' do
      create(:member, user_id: user.id, group_id: group_1.id)
      create(:member, user_id: user_2.id, group_id: group_1.id)
      create(:member, user_id: user.id, group_id: group_2.id)
      create(:member, user_id: user_3.id, group_id: group_2.id)

      expect(members).to include user_2, user_3
    end
  end
end
