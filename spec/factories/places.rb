FactoryBot.define do
  factory :place do
    association :user

    post_code      {"1500001"}
    prefecture     {"東京都"}
    city_name      {"渋谷区"}
    address        {"神宮前"}
    building       {"神宮ハウス"}
    
    
  end
end
