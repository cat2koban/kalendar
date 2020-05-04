require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { create(:user) }

  describe '#corrent_user' do
    context 'ログイン中のユーザーがいない時' do
      it 'nilを返す' do
        expect(current_user.nil?).to be_truthy
      end
    end

    context 'ログイン中のユーザーがいる時' do
      it '正しいユーザーを返す' do
        log_in(user)
        expect(current_user).to eq user
      end
    end
  end
end
