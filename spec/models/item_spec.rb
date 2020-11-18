require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
    @item.image = fixture_file_upload('public/image/test_image.png')
  end

  describe '商品の新規出品' do
    context '商品の新規出品がうまく行くとき' do
      it '全ての項目が存在すると出品登録が保存できる' do
        expect(@item).to be_valid
      end
      it '価格の範囲が￥300~￥9999999の間なら保存できる'do
        @item.price = '99999'
        expect(@item).to be_valid
      end
      it '販売価格が半角数字のみだと出品保存ができる' do
        @item.price = '12345'
        expect(@item).to be_valid
      end
    end

    context '商品の新規出品保存がうまくいかないとき'do
      it 'nameが空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'category_idがid.1だと保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが空だと保存できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it 'status_idがid.1だと保存できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'shipping_fee_burden_idが空だと保存できない' do
        @item.shipping_fee_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden is not a number")
      end
      it 'shipping_fee_burden_idがid.1だと保存できない' do
        @item.shipping_fee_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden must be other than 1")
      end
      it 'shipping_area_idが空だと保存できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area is not a number")
      end
      it 'shipping_area_idがid.1だと保存できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it 'days_ship_idが空だと保存できない' do
        @item.days_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship is not a number")
      end
      it 'days_ship_idがid.1だと保存できない' do
        @item.days_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship must be other than 1")
      end
      it 'priceが空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300以下だと保存できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceが9999999以上だと保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it 'ユーザーが紐付いていないと保存ができない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
