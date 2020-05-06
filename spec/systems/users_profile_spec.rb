require 'rails_helper'

RSpec.describe 'UsersProfile', type: :system do
  let(:user) { create(:user) }

  context 'ログインしていない時' do
    it '/login にリダイレクトされる' do
      visit user_path(user)
      expect(current_path).to eq login_path
    end
  end

  context 'ログインしている時' do
    before do
      login(user, by_capybara: true)
    end

    it 'プロフィールページが閲覧できる' do
      visit user_path(user)
      expect(current_path).to eq user_path(user)
    end

    it 'タスク一覧が閲覧できる' do
      create(:task, user: user)
      visit user_path(user)
      expect(page).to have_content(user.tasks.first.title)
    end

    it '他の人のタスク一覧は閲覧できない' do
      other_user = create(:user)
      create(:task, user: other_user)
      visit user_path(other_user)
      expect(page).to_not have_content(other_user.tasks.first.title)
    end
  end
end
