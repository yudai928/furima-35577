require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品できる時' do
      it '全ての情報が正しく入力されている場合、出品できること' do
        expect(@item).to be_valid
      end
    end
    context '出品できない時' do
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '販売価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '商品の画像が空では出品できない' do
        @item.image = []
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '商品のカテゴリーを選択しなければ出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態を選択しなければ出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it '商品の配送料の負担を選択しなければ出品できない' do
        @item.shipping_rate_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping rate is not a number")
      end
      it '商品の発送元を選択しなければ出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area is not a number")
      end
      it '商品の配送日数を選択しなければ出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day is not a number")
      end
      it '商品の販売価格は300円以上でなければ出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '商品の販売価格は9,999,999円以下でなければ出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '商品の販売価格は半角数字の入力でなければ出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
  
