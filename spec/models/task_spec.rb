require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_length_of(:title).is_at_most(40) }
    it { is_expected.to validate_length_of(:description).is_at_most(255) }
  end

  describe 'belongs_to' do
    it { should belong_to(:user) }
  end

  context "正しいタスクを作成した時" do
    it 'valid と返す' do
      expect(task).to be_valid
    end
  end

  context 'title が空白の時' do
    it 'invalid と返す' do
      task = build(:task, title: ' ' * 10)
      expect(task).to_not be_valid
    end
  end
end
