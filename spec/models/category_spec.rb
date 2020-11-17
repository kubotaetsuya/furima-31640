require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規出品' do
    context '商品の新規出品がうまく行くとき' do
      it 'カテゴリーデータが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
