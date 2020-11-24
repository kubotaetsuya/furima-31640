require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
  end
  describe '購入情報の保存' do
    context '購入がうまく行く時' do
      it '全ての情報が正しく存在すると購入ができる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end

    context '購入がうまくいかない時' do
      it 'postcodeが空だと保存できない' do
        @order_address.postcode = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeにハイフンを含んだ形式でないと保存できない' do
        @order_address.postcode = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid")
      end
      it 'postcodeがハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postcode = "1234-321"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid")
      end
      it 'shipping_area_idが空だと保存ができない' do
        @order_address.shipping_area_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'cityが英数字だと保存できない' do
        @order_address.city = "ety123"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City is invalid")
      end
      it 'blockが空だと保存できない' do
        @order_address.block = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンが含まれると保存できない' do
        @order_address.phone_number = "123-1234-1234"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが数字のみでないと保存できない' do
        @order_address.phone_number = "asdfghjkasd"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberの数字の数が11でないと保存できない' do
        @order_address.phone_number = "090"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが存在しないと保存できない' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
