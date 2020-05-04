require 'rails_helper'

RSpec.describe 'UsersLogin', type: :system do
  let(:user) { create(:user) }

  context 'アカウントが存在しない時' do
    it '「Invalid email/password combination.」と表示される' do
      visit login_path
      fill_in 'Email',    with: 'nobody@example.com'
      fill_in 'Password', with: 'piyopiyo'
      click_button 'Log in'
      expect(page).to have_content 'Invalid email/password combination.'
    end
  end

  context 'ログインに成功した時' do
    it '「Logged in successfully.」と表示され、/home にリダイレクトされる' do
      visit login_path
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content 'Logged in successfully.'
      expect(current_path).to eq root_path
    end

    it 'ログアウトできる' do
      visit login_path
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      find('.navbar-link').hover
      click_link 'Log out'
      expect(page).to have_content 'Logged out successfully.'
    end
  end
end
