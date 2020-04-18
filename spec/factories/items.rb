FactoryBot.define do

  factory :item do
    association :user
    association has_many { :images }

    name              {"スカート"}
    price             {"100"}
    description       {"チョーかわいい"}
    status            {"2"}
    cost              {"2"}
    days              {"2"}
    size              {"2"}
    category_id       {"3"}

    
  end
  
end
