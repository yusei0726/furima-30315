#  basic認証
username: admin
password: 2222

#  テーブル設計

## usersテーブル
|Column             |Type         |Options                  |
|-------------------|-------------|-------------------------|
|nickname           |string       |null: false              |
|email              |string       |null: false, unique: true|
|encrypted_password |string       |null: false              |
|last_name_kanji    |string       |null: false              |
|first_name_kanji   |string       |null: false              |
|last_name_kana     |string       |null: false              |
|first_name_kana    |string       |null: false              |
|birthday           |date         |null: false              |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
|Column              |Type         |Options          |
|--------------------|-------------|-----------------|
|title               |string       |null: false      |
|concept             |text         |null: false      |
|category_id         |integer      |null: false      |
|product_status_id   |integer      |null: false      |
|shipping_charge_id  |integer      |null: false      |
|shipping_day_id     |integer      |null: false      |
|prefecture_id       |integer      |null: false      |
|price               |integer      |null: false      |
|user                |references   |foreign_key: true|

### Association
- belongs_to :user
- has_one    :purchase


## purchasesテーブル
|Column         |Type         |Options          |
|---------------|-------------|-----------------|
|user           |references   |foreign_key: true|
|item           |references   |foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one    :adderss

## addressesテーブル
|Column         |Type         |Options          |
|---------------|-------------|-----------------|
|postal_code    |string       |null: false      |
|prefecture_id  |integer      |null: false      |
|municiparity   |string       |null: false      |
|house_number   |string       |null: false      |
|building_name  |string       |                 |
|phone_number   |string       |null: false      |
|purchase       |references   |foreign_key: true|

### Association
- belongs_to :purchase
