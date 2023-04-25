# README


# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| email              | string | null: false,  unique: true |
| encrypted_password | string | null: false                |
| nickname          | string | null: false                |
| iv_f_name          | string | null: false                |
| iv_l_name          | string | null: false                |
| iv_f_name_kana     | string | null: false                |
| iv_l_name_kana     | string | null: false                |
| birthday           | date   | null: false                |

### Association

- has_many :items
- has_many :orders






## items テーブル

| Column                | Type       | Options                        |
| --------------------  | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| description           | text       | null: false                    |
| item_category_id      | integer    | null: false                    |
| item_description_id   | integer    | null: false                    |
| shipping_fee_id       | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| shipping_term_id      | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |





### Association

- belongs_to :user
- has_one:order






## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
### Association

- belongs_to :item
- belongs_to :user
- has_one:sender

## senders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postalcode         | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| detailed_address   | string     | null: false                    |
| building           | string     |                                |
| tel                | string     | null: false                    |
| order              | references | null: false, foreign_key: true |


### Association

- belongs_to :order
