require 'rails_helper'
describe User do
  describe '#create' do

    it "is invalid last_name 半角" do
      user = build(:user, last_name: "vvv")
      user.valid?
      expect(user.errors[:last_name]).to include("全角で入力してください")
    end
    it "is invalid first_name 半角" do
      user = build(:user, first_name: "xxx")
      user.valid?
      expect(user.errors[:first_name]).to include("全角で入力してください")
    end
    it "is invalid last_kana 全角カタカナ以外" do
      user = build(:user, last_kana: "おおた")
      user.valid?
      expect(user.errors[:last_kana]).to include("全角カタカナで入力してください")
    end
    it "is invalid last_kana 全角カタカナ以外" do
      user = build(:user, first_kana: "こうじ")
      user.valid?
      expect(user.errors[:first_kana]).to include("全角カタカナで入力してください")
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "is invalid password count is 7 under" do
      user = build(:user, password: "123456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it "is invalid deferent password & password_confirmation" do
      user = build(:user, password: "00000000", password_confirmation: "11111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "is invalid without a last_kana" do
      user = build(:user, last_kana: "")
      user.valid?
      expect(user.errors[:last_kana]).to include("を入力してください")
    end
    it "is invalid without a first_kana" do
      user = build(:user, first_kana: "")
      user.valid?
      expect(user.errors[:first_kana]).to include("を入力してください")
    end
    it "is invalid without a birth" do
      user = build(:user, birth: "")
      user.valid?
      expect(user.errors[:birth]).to include("を入力してください")
    end


    
  end
end