require 'rails_helper'
describe Item do
  describe  '#create'  do
    it  "必須項目を入力すれば出品できること"  do
      expect(build(:item, :with_image)).to be_valid
    end

    it  "商品名が空では出品できないこと"  do
      item = build(:item, :with_image, name:"")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
   
    it  "商品の説明が空では出品できないこと"  do
      item = build(:item, :with_image, description:"")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it  "商品の価格が空では出品できないこと"  do
      item = build(:item, :with_image, price:"")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it  "商品状態が空では出品できないこと"  do
      item = build(:item, :with_image, status:"")
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it  "商品状態が１(---)では出品できないこと"  do
      item = build(:item, :with_image, status:"1")
      item.valid?
      expect(item.errors[:status]).to include 
    end

    it  "配送料が空では出品できないこと"  do
      item = build(:item, :with_image, cost:"")
      item.valid?
      expect(item.errors[:cost]).to include("を入力してください")
    end

    it  "配送料が１(---)では出品できないこと"  do
      item = build(:item, :with_image, cost:"1")
      item.valid?
      expect(item.errors[:cost]).to include
    end

    it  "到着までの日数が空では出品できないこと"  do
      item = build(:item, :with_image, days:"")
      item.valid?
      expect(item.errors[:days]).to include("を入力してください")
    end

    it  "到着までの日数が１(---)では出品できないこと"  do
      item = build(:item, :with_image, days:"1")
      item.valid?
      expect(item.errors[:days]).to include
    end

    it  "カテゴリーが空では出品できないこと"  do
      item = build(:item, :with_image, category_id:"")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end
    
    it  "カテゴリーが１(---)では出品できないこと"  do
      item = build(:item, :with_image, category_id:"1")
      item.valid?
      expect(item.errors[:category_id]).to include
    end
    
    it  "商品画像が空では出品できないこと"  do
      item = build(:item)
      item.valid?
      expect(item.errors[:images]).to include("を入力してください")     
    end

    it  "サイズは空でも出品できること"  do
      item = build(:item, :with_image, size:"")
      item.invalid?
      expect(item).to be_valid
    end

    # describe  '#update'  do
    

  end
end