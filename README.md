# README

## テーブルの設計図

## usersテーブル 
| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| nickname             | string   | null: false |
| email                | string   |null: false, uniqueness |
| encrypted_password   | string   | null: false |
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
| name            | string   | null: false |
| description     | text     | null: false |
| category_id             | integer  | null: false |
| status_id          | integer  | null: false |
| shipping_fee_burden_id  | integer  | null: false |
| shipping_area_id        | integer  | null: false |
| days_ship_id            | integer  | null: false |
| price                | integer  | null: false |
| user                 | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## ordersテーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| user                 | references | foreign_key: true |
| item                 | references | foreign_key: true |
### Association

- belongs_to :user
- has_one :address
- belongs_to :item


## addressテーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| postcode             | string | null:false  |
| shipping_area_id        | integer | null:false  |
| city                 | string | null:false  |
| block                | string | null:false  |
| building             | string |             |
| phone_number         | string | null:false |
| order                | references | foreign_key: true |

### Association

- belongs_to :order