require 'rails_helper'
describe Item do
  describe  '#create'  do
    it  "商品名が空では出品できないこと"  do
      item = build(:item, name:"")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")     
    end
  end
end