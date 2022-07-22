require 'rails_helper'

RSpec.describe "Spots", type: :system do
  let(:user) { create(:user) }
  let(:spot) { create(:spot, user: user) }

  describe 'スポット情報のCRUD' do
    describe 'スポット情報の一覧' do
      it 'ナビゲーションバーのリンクからスポット情報一覧へ遷移できること' do
        visit root_path
        click_on('検索')
        expect(current_path).to eq(spots_path)
      end

      context 'スポット情報が一件もない場合' do
        it '「スポット情報がありません」と表示されること' do
          visit spots_path
          expect(page).to have_content('登録されているスポットがありません')
        end
      end

      context 'スポット情報がある場合' do
        it 'スポット情報の一覧が表示されること' do
          spot
          visit spots_path
          expect(page).to have_content(spot.name)
        end
      end
    end
  end
end
