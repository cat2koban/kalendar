require 'rails_helper'

RSpec.describe 'Task', type: :system do
  context 'ログインしていない時' do
    it '/login にリダイレクトされる' do
      visit tasks_path
      expect(current_path).to eq login_path
    end
  end

  context 'ログインしている時' do
    let(:user) { create(:user) }

    before do
      login(user, by_capybara: true)
      find('.create-button').click
    end

    context 'Title が空白の時' do
      it '「Title can\'t be blank」と表示される' do
        click_button 'Save'
        expect(page).to have_content 'Title can\'t be blank'
      end
    end

    context 'Start_at が空白の時' do
      it '「Start_at can\'t be blank」と表示される' do
        click_button 'Save'
        expect(page).to have_content 'Start at can\'t be blank'
      end
    end

    context 'Finish_at が空白の時' do
      it '「Finish_at can\'t be blank」と表示される' do
        click_button 'Save'
        expect(page).to have_content 'Finish at can\'t be blank'
      end
    end

    context 'タスクの登録に成功した時' do
      it 'ホームページにリダイレクトされ、フラッシュが表示される ' do
        fill_in 'Title',       with: 'Test Creation!!'
        fill_in 'Start at',    with: Time.now
        fill_in 'Finish at',   with: Time.now.since(1.hours)
        fill_in 'Description', with: 'Its test description !! :)'
        click_button 'Save'
        expect(current_path).to eq root_path
        expect(page).to have_content 'Your task has been successfully created :)'
      end
    end
  end
end
