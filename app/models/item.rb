class Item < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :status
  
  belongs_to :category
  belongs_to :user
  has_many :images, dependent: :destroy
  
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :price, :description, :status, :cost, :days, :category_id, presence: true
  validates :status, :cost, :days, format:{ without:/[1]/, message: "選択してしてください" }
  validates_associated :images
  validates :images, presence: true

end
