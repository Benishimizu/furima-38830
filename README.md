# README


# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| email              | string | null: false,  unique: true |
| encrypted_password | string | null: false                |
| nick_name          | string | null: false                |
| iv_f_name          | text   | null: false                |
| iv_l_name          | text   | null: false                |
| iv_f_name_kana     | text   | null: false                |
| iv_l_name_kana     | text   | null: false                |
| birthday           | text   | null: false                |

### Association

- has_many :products



## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| catch_copy         | text       | null: false                    |
| concept            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- has_one:po



## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| products  | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :products


## po テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| products  | references | null: false, foreign_key: true |


### Association

- belongs_to :products

## sender_info テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postalcode         | text       | null: false                    |
| prefecture         | text       | null: false                    |
| city               | text       | null: false                    |
| detailed_address   | text       | null: false                    |
| building           | text       | null: false                    |
| tel               | text       | null: false                     |
| products           | references | null: false, foreign_key: true |


### Association

- belongs_to :products