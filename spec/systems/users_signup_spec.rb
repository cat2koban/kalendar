require 'rails_helper'

RSpec.describe 'UsersSignup', type: :system do
  scenario '無効なユーザー情報だと登録できない' do
    visit signup_path

    fill_in 'Name', with: 'a' * 51
    click_button 'Sign Up'
    expect(page).to have_content 'Name is too long (maximum is 50 characters)'

    fill_in 'Email', with: 'invalid@invalid'
    click_button 'Sign Up'
    expect(page).to have_content 'Email is invalid'
    expect(page).to have_content 'Password can\'t be blank'

    fill_in 'Password', with: 'foo'
    fill_in 'Password confirmation', with: 'foo'
    click_button 'Sign Up'
    expect(page).to have_content 'Password is too short (minimum is 6 characters)'

    fill_in 'Password', with: 'foobarbaz'
    fill_in 'Password confirmation', with: 'inva1iddddd'
    click_button 'Sign Up'
    expect(page).to have_content 'Password confirmation doesn\'t match Password'
  end

  scenario '有効なユーザー情報だと登録できる' do
    visit signup_path
    expect do
      fill_in 'Name',     with: 'valid user'
      fill_in 'Email',    with: 'thisUseris@invalid.com'
      fill_in 'Password', with: 'va1idPassw0rd!'
      fill_in 'Password confirmation', with: 'va1idPassw0rd!'
      click_button 'Sign Up'
    end.to change { User.all.length }.from(0).to(1)
    user = User.find_by(email: 'thisuseris@invalid.com')
    expect(current_path).to eq user_path(id: user.id)
    expect(page).to have_content 'Your account has been successfully created.'
  end
end
