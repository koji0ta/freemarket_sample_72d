FactoryBot.define do

  factory :item do
    user
    category

    name              {"スカート"}
    price             {"100"}
    description       {"チョーかわいい"}
    status            {"2"}
    cost              {"2"}
    days              {"2"}
    size              {"2"}

    trait :with_image do
      after(:build) do |item|
        item.images << FactoryBot.build(:image)
      end
    end

  end
end
