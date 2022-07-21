require 'rails_helper'

RSpec.describe "Spots", type: :system do
  let(:user) { create(:user) }
  let(:spot) { ccreate(:spot, user: user) }

  describe 'スポット情報のCRUD' do
    describe 'スポット情報の一覧' do
      it 'フッターのリンクからスポット情報一覧へ遷移できること' do
        click_link '検索'
        click_on('リスト表示')
        expect(current_path).to eq(spots_path)
      end
    end
  end
end
