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
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end

      it "item_nameが空では出品できない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it "descriptionが空では出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "item_descriptionが空では出品できない" do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "商品カテゴリーが空では出品できない" do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品カテゴリーが空では出品できない")
      end
      it "配送料の負担が空では出品できない" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担が空では出品できない")
      end

      it "発送元の地域が空では出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県が空では出品できない")
      end

      it "発送までの日数が空では出品できない" do
        @item.shipping_term_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数が空では出品できない")
      end


      it "商品価格が空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格を入力してください")
      end



      it 'priceは全角数値では出品できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は全角数値では出品できない")
      end

      it 'priceが￥299以下では出品できない' do
        @item.price =299
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格を￥300以上￥10,000,000以下で設定してください")
      end
      it "priceが￥10,000,000以上では出品できない" do
        @item.price=10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格を￥300以上￥10,000,000以下で設定してください")
      end

      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザー名を入力してください')
      end


    end
  end
end

