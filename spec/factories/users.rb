FactoryBot.define do

  factory :user do

    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_kana             {"ヤマダ"}
    first_kana            {"タロウ"}
    birth                 {"19860909"}
    
    trait :with_place do
      after(:build) do |user|
        place = FactoryBot.build(:place)
      end
    end
  end

end

