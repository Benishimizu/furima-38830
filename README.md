# README


# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| email              | string | null: false,  unique: true |
| encrypted_password | string | null: false                |
| nick_name          | string | null: false                |
| iv_f_name          | string | null: false                |
| iv_l_name          | string | null: false                |
| iv_f_name_kana     | string | null: false                |
| iv_l_name_kana     | string | null: false                |
| birthday           | date   | null: false                |

### Association

- has_many :products
- has_many :orders






## products テーブル

| Column                | Type       | Options                        |
| --------------------  | ---------- | ------------------------------ |
| product_name          | string     | null: false                    |
| description           | text       | null: false                    |
| product_category_id   | string     | null: false                    |
| product_description_id| text       | null: false                    |
| shipping_fee_id       | string     | null: false                    |
| prefecture_id         | string     | null: false                    |
| shipping_term_id      | string     | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |





### Association

- belongs_to :user
- has_one:order






## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| product   | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

## senders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postalcode         | string     | null: false                    |
| prefecture_id      | string     | null: false                    |
| city               | string     | null: false                    |
| detailed_address   | string     | null: false                    |
| building           | string     |                                |
| tel                | string     | null: false                    |
| product           | references | null: false, foreign_key: true |


### Association

- belongs_to :product
