require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報の保存' do
    context '商品情報が保存できる場合' do
      it 'name, product_description, category_id, status_id, shipping_fee_id, shippinng_prefecture_id, scheduled_delivery_id, price, imageが存在すれば保存できる' do
        expect(@item).to be_valid
      end
      it 'priceが300~9999999の間であり半角数字であれば保存できる' do
        @item.price = 500
        expect(@item).to be_valid
      end
    end

    context '商品情報が保存できない場合' do
      it 'nameが空の場合保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'product_descriptionが空の場合保存できない' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'category_idが1の場合保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1の場合保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'shipping_fee_idが1の場合保存できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee must be other than 1')
      end
      it 'shipping_prefecture_idが1の場合保存できない' do
        @item.shipping_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping prefecture must be other than 1')
      end
      it 'scheduled_delivery_idが1の場合保存できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
      end
      it 'priceが空の場合保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下だと保存できない' do
        @item.price = 20
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが10000000以上だと保存できない' do
        @item.price = 10000005
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角数字ではないと保存できない' do
        @item.price = '６００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userと紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
