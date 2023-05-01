require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end



  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do

      it "出品できる" do
        expect(@item).to be_valid
      end

    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "item_nameが空では出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "descriptionが空では出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "item_descriptionが空では出品できない" do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it "item_categoryが空では出品できない" do
        @item.item_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it "shipping_feeが空では出品できない" do
        @item.shipping_fee = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it "prefectureが空では出品できない" do
        @item.prefecture = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "shipping_termが空では出品できない" do
        @item.shipping_term = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping term can't be blank")
      end


      it "priceが空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end



      it 'priceは全角数値では出品できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角文字を使用してください")
      end

      it '価格が￥299以下では出品できない' do
        @item.price <299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300以上してください")
      end
      it "価格が￥10,000,000以上では出品できない" do
        @item.price>10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥9,999,999以下してください")
      end


    end
  end
end


#  ACTIVEHASHの時のvalidation 1,0に気をつける

#  画像；CHAT APPwosannsyou


