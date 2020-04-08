class Place < ApplicationRecord
  belongs_to :user
  validates :post_code, :prefecture, :city_name, :address, presence: true

  
end
