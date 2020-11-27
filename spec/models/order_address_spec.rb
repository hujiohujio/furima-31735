require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.build(:item)
      @order_address = FactoryBot.build(:order_address, item.id)
    end
    it 'building_name以外の全ての値が入力されていれば保存できる' do
      expect(@order_address).to be_valid
        
    end
    it 'postal_codeが空の場合保存できない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'prefecture_idが空の場合保存できない' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空の場合保存できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空の場合保存できない' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'phoneが空の場合保存できない' do
      @order_address.phone = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが12桁以上の場合保存できない' do
      @order_address.phone = "000000000000"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone is invalid")
    end
  end
end






