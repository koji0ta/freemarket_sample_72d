require 'rails_helper'
describe ItemsController do
  describe 'PATCH #update' do
    before do 
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, :with_image)
    end

      it "商品名が更新されるか" do
        sign_in @user
        item_params = FactoryBot.attributes_for(:item, name: "カットソー")
        patch :update, params: {id: @item.id, item: item_params}
        expect(@item.reload.name).to eq "カットソー"
      end
     
   end
end