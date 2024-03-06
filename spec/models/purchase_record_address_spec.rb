require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_address = FactoryBot.build(:purchase_record_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入情報の保存' do

    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchase_record_address).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @purchase_record_address.building_name = ''
        expect(@purchase_record_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_codeが空だと購入できないこと' do
        @purchase_record_address.post_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @purchase_record_address.post_code = '1234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefectureが---では購入できないこと' do
        @purchase_record_address.prefecture_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できないこと' do
        @purchase_record_address.city = ""
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では購入できないこと' do
        @purchase_record_address.street_address = ""
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空では購入できないこと' do
        @purchase_record_address.phone_number = ""
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角では購入できないこと' do
        @purchase_record_address.phone_number = "１２３４５６７８９１０"
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下では購入できないこと' do
        @purchase_record_address.phone_number = "123456789"
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では購入できないこと' do
        @purchase_record_address.phone_number = "012345678910"
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空では保存できないこと' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end