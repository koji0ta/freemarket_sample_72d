# README

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|string|null: false|
|status|integer|null: false|
|cost|integer|null: false|
|days|integer|null: false|
|size|string||
|caetegory_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category, dependent: :destroy
- belongs_to :user
- has_many :images, dependent: :destroy


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null:false|
|first_name|string|null:false|
|last_kana|string|null:false|
|first_kana|string|null:false|
|birth|string|null:false|
|phone|integer|
|password|string|null:false|
|password_confirmation|string|null:false|
|email|string|null:false|
|nickname|string|

### Association
- has_many :items, dependent: :destroy
- has_many :cards, dependent: :destroy
- belongs_to :place, dependent: :destroy


## placesテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null:false|
|prefecture|string|null:false|
|city_name|string|null:false|
|address|string|null:false|
|building|string|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|number|integer|null:false, unique: true|
|expiration_date|integer|null:false|
|authorization_number|integer|null:false|

### Association
- belongs_to :user0
