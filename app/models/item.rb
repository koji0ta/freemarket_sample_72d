class Item < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :status
  
  # belongs_to :category, dependent: :destroy
  belongs_to :user
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images,　allow_destroy: true

end
