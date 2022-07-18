require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました'
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end

    context 'フォームが未入力' do
      it 'ログイン処理に失敗する' do
        visit login_path
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインに失敗しました'
        expect(page).to have_current_path login_path, ignore_query: true
      end
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウト処理に成功する' do
        login_as(user)
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end
  end
end
