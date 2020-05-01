require 'rails_helper'

RSpec.describe 'UsersSignup', type: :system do
  context '名前が50文字以上の時' do
    it '「maximum is 50 characters」と表示される' do
      visit signup_path
      fill_in 'Name', with: 'a' * 51
      click_button 'Sign Up'
      expect(page).to have_content 'Name is too long (maximum is 50 characters)'
    end
  end

  context 'メールアドレスが空白の時' do
    it '「Emails is invalid」と表示される' do
      visit signup_path
      fill_in 'Email', with: 'invalid@invalid'
      click_button 'Sign Up'
      expect(page).to have_content 'Email is invalid'
    end
  end

  context 'パスワードが空白の時' do
    it '「Password can\'t be blank」と表示される' do
      visit signup_path
      click_button 'Sign Up'
      expect(page).to have_content 'Password can\'t be blank'
    end
  end

  context 'パスワードが6文字以下の時' do
    it '「Password is too short (minimum is 6characters)」と表示される' do
      visit signup_path
      fill_in 'Password', with: 'foo'
      fill_in 'Password confirmation', with: 'foo'
      click_button 'Sign Up'
      expect(page).to have_content 'Password is too short (minimum is 6 characters)'
    end
  end

  context 'パスワードが一致しない時' do
    it '「Password confirmation doesn\'t match Password」と表示される' do
      visit signup_path
      fill_in 'Password', with: 'foobarbaz'
      fill_in 'Password confirmation', with: 'inva1iddddd'
      click_button 'Sign Up'
      expect(page).to have_content 'Password confirmation doesn\'t match Password'
    end
  end

  context 'ユーザーの登録に成功した時' do
    it 'ユーザーページにリダイレクトされ、フラッシュが表示される' do
      visit signup_path
      fill_in 'Name',     with: 'valid user'
      fill_in 'Email',    with: 'thisUseris@invalid.com'
      fill_in 'Password', with: 'va1idPassw0rd!'
      fill_in 'Password confirmation', with: 'va1idPassw0rd!'
      click_button 'Sign Up'
      user = User.find_by(email: 'thisuseris@invalid.com')
      expect(current_path).to eq user_path(id: user.id)
      expect(page).to have_content 'Your account has been successfully created.'
    end
  end
end
