require 'rails_helper'

RSpec.describe Spot, type: :model do

  context 'すべてのフィールドが有効な場合' do
    it '有効であること' do
      spot = build(:spot)
      expect(spot).to be_valid
    end
  end

  context 'スポット名が存在しない場合' do
    it '無効であること' do
      spot = build(:spot, name: nil)
      expect(spot).to be_invalid
      expect(spot.errors[:name]).to include('を入力してください')
    end
  end
  
  context '住所が存在しない場合' do
    it '無効であること' do
      spot = build(:spot, address: nil)
      expect(spot).to be_invalid
      expect(spot.errors[:address]).to include('を入力してください')
    end
  end
  
  context '緯度が存在しない場合' do
    it '無効であること' do
      spot = build(:spot, latitude: nil)
      expect(spot).to be_invalid
      expect(spot.errors[:latitude]).to include('を入力してください')
    end
  end

  context '経度が存在しない場合' do
    it '無効であること' do
      spot = build(:spot, longitude: nil)
      expect(spot).to be_invalid
      expect(spot.errors[:longitude]).to include('を入力してください')
    end
  end
end
