require 'rails_helper'

describe Place do
  describe '#create' do
    # 1
    it "post_codeとprefectureとcity_nameとaddressが存在すれば登録できること" do
      place = build(:place)
      expect(place).to be_valid
    end
  end
end
