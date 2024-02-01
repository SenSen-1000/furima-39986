# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| -------------------| ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| read_family_name   | string | null: false               |
| read_first_name    | string | null: false               |
| birth_date         | date   | null: false               |

### Association
has_many :items
has_many :purchase_records


## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_name               | string     | null: false                    |
| item_explanation        | text       | null: false                    |
| category_id             | integer    | null: false                    |
| condition_id            | integer    | null: false                    |
| delivery_charge_load_id | integer    | null: false                    |
| prefectures_id          | integer    | null: false                    |
| number_of_days_id       | integer    | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one    :purchase_record


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| city            | string     | null: false                    |
| street_address  | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association
has_one :purchase_record


## purchase_records テーブル
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one    :address
