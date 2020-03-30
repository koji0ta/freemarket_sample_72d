# README

## itemテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|string|null: false|
|images|string|null: false|
|status|string||
|cost|integer|null: false|
|days|integer|null: false|
|size|string||
|caetegory_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :user


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :item


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|last_name|string|null:false|
|first_name|string|null:false|
|last_kana|string|null:false|
|first_kana|string|null:false|
|birth|string|null:false|
|post|string|
|prefecture|string|
|city_name|string|
|address|string|
|building|string|
|phone|integer|
|password|string|
|password_confirmation|string|
|email|string|null:false|
|nickname|string|

### Association
- has_many :items
- has_many :card


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|integer|
|number|integer|null:false,unique: true|
|expiration_date|integer|null:false|
|authorization_number|integer|null:false|

### Assiciation
- belongs_to :user
