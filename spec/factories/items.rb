FactoryBot.define do

  factory :item do
    association :user

    name              {"スカート"}
    price             {"100"}
    description       {"チョーかわいい"}
    status            {"2"}
    cost              {"2"}
    days              {"2"}
    size              {"2"}
    category_id       {"3"}

    trait :with_image do
      after(:build) do |item|
        item.images << FactoryBot.build(:image)
      end
    end

  end
end
