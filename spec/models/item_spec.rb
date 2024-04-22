require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it '' do
      end
    end
    context '商品出品できない場合' do
      it 'imageが空では商品出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'productが空では商品出品できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end

      it 'productが41字以上では商品出品できない' do
        @item.product = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Product is too long (maximum is 40 characters)")
      end

      it 'seller_commentが空では商品出品できない' do
        @item.seller_comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Seller comment can't be blank")
      end

      it 'seller_commentが1001字以上では商品出品できない' do
        @item.seller_comment = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Seller comment is too long (maximum is 1000 characters)")
      end

      it 'categoryが---では商品出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      
      it 'conditionが---では商品出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      
      it 'postage_type_idが---では商品出品できない' do
        @item.postage_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage type must be other than 1")
      end
      
      it 'region_idが---では商品出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 1")
      end
      
      it 'shopping_date_idが---では商品出品できない' do
        @item.shopping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping date must be other than 1")
      end

      it 'priceが空では商品出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では商品出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9,999,999以上では商品出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが半角数字でないと商品出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end