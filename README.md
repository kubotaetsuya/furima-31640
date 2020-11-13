# README

## テーブルの設計図

## usersテーブル

| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| nickname             | string   | null: false |
| email                | string   | unique: true |
| encrypted_password   | integer  | null: false |
| last_name            | string   | null: false |
| first_name           | string   | null: false |
| last_name_kana       | string   | null: false |
| first_name_kana      | string   | null: false |
| birthday             | date     | null: false |

### Association

- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| item_name            | string   | null: false |
| item_description     | text     | null: false |
| category             | integer  | null: false |
| item_status          | integer  | null: false |
| shipping_fee_burden  | integer  | null: false |
| shipping_area        | integer  | null: false |
| days_ship            | integer  | null: false |
| price                | integer  | null: false |
| user                 | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase_record

## purchase_recordsテーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| user                 | references | foreign_key: true |
| purchase_date        | datetime   | null: false|
| item                 | references | foreign_key: true |
### Association

- belongs_to :user
- has_one :shipping_address
- has_one :items


## shipping_addressテーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| postcode             | integer | null:false  |
| prefecture           | integer | null:false  |
| city                 | string | null:false  |
| block                | string | null:false  |
| building             | string |             |
| phone_number         | string | null:false |
| card                 | references | foreign_key: true |

### Association

- belongs_to :purchase_record