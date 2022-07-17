require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'ユーザー新規登録' do
    context 'フォームの入力値が正常' do
      it 'ユーザーの新規登録が成功する' do
        visit new_user_path
        fill_in 'アカウント名', with: 'user_test'
        fill_in 'メールアドレス', with: 'user_test@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録が完了しました'
        expect(current_path).to eq login_path
      end
    end

    context 'アカウント名が未入力' do
      it 'ユーザーの新規登録が失敗する' do
        visit new_user_path
        fill_in 'アカウント名', with: ''
        fill_in 'メールアドレス', with: 'user_test@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'アカウント名を入力してください'
        expect(current_path).to eq users_path
      end
    end

    context 'メールアドレスが未入力' do
      it 'ユーザーの新規登録が失敗する' do
        visit new_user_path
        fill_in 'アカウント名', with: 'user_test'
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(current_path).to eq users_path
      end
    end

    context '登録済みのメールアドレスを使用' do
      it 'ユーザーの新規登録が失敗する' do
        exsited_user = create(:user)
        visit new_user_path
        fill_in 'アカウント名', with: 'user_test'
        fill_in 'メールアドレス', with: exsited_user.email
        fill_in 'パスワード', with: 'password' 
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'メールアドレスはすでに存在します'
        expect(current_path).to eq users_path
      end
    end
  end
end
