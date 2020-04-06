class Item < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :user
  has_many :images, dependent: :destroy

end
