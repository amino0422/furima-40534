require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item,)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it "全ての項目があれば保存ができる" do
      expect(@order_form).to be_valid
    end

    it "建物名は空でも保存ができる" do
      @order_form.building = nil
      expect(@order_form).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'user_idが空では登録できない' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end
  
    it 'item_idが空では登録できない' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end

    it "tokenが空では登録できない" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end

    it "post_codeが空では保存ができない" do
      @order_form.post_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code can't be blank")
    end

    it "post_codeが-無しでは保存ができない" do
      @order_form.post_code = "1234567"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code is invalid. Input correctly")
    end

    it "post_codeが半角でないと保存ができない" do
      @order_form.post_code = "１２３－４５６７"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code is invalid. Input correctly")
    end

    it "region_idが---では保存ができない" do
      @order_form.region_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Region can't be blank")
    end

    it "cityが空では保存ができないこと" do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it "street_addressが空では保存ができない" do
      @order_form.street_address = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Street address can't be blank")
    end

    it "phone_numberが空では保存ができない" do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが9桁以下では保存ができない" do
      @order_form.phone_number = "090123456"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid.")
    end

    it "phone_numberが12桁以上では保存ができない" do
      @order_form.phone_number = "090123456789"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid.")
    end

    it "phone_numberが半角数値でないと保存ができない" do
      @order_form.phone_number = "０９０１２３４５６７８"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid.")
    end
  end
end