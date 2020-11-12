# README

## テーブルの設計図

## usersテーブル

| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| nickname             | string   | null: false |
| email                | string   | null: false |
| encrypted_password   | integer  | null: false |
| last_name            | string   | null: false |
| first_name           | string   | null: false |
| last_name_kana       | string   | null: false |
| first_name_kana      | string   | null: false |
| birth_year           | integer  | null: false |
| birth_month          | integer  | null: false |
| birth_day            | integer  | null: false |

### Association

- has_many :items
- has_many :card_info

## itemsテーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| item_img             | binary  | null: false |
| item_name            | string  | null: false |
| item_description     | text    | null: false |
| category             | string  | null: false |
| item_status          | string  | null: false |
| shipping_fee_burden  | string  | null: false |
| shipping_area        | string  | null: false |
| days_ship            | string  | null: false |
| price                | integer | null: false |
| fee                  | integer  | null:false |
| profit               | integer  | null:false |
| user_id              | references | foreign_key: true |

### Association

- belongs_to :user

## card_infoテーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| card_number          | integer | null:false |
| expiration_month     | integer | null:false |
| expiration_year      | integer | null:false |
| security_card_number | integer | null:false |
| user_id              | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :shipping_address

## shipping_addressテーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| postcode             | string | null:false  |
| prefecture           | string | null:false  |
| city                 | string | null:false  |
| block                | string | null:false  |
| building             | string |             |
| phone_number         | integer | null:false |
| card_id              | references | foreign_key: true |

### Association

- belongs_to :card_info