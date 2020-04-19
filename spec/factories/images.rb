FactoryBot.define do
  factory :image do
    src { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/item_test3.jpeg'), 'image/jpeg') }
    # src {File.open("#{Rails.root}/spec/fixtures/item_test3.jpeg")}
  end
end
