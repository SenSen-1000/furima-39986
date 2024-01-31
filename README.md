# テーブル設計

## users テーブル

| Column             | Type        | Options                   |
| -------------------| ----------- | ------------------------- |
| nickname           | string      | null: false               |
| email              | string      | null: false, unique: true |
| encrypted_password | string      | null: false               |
| name               | string      | null: false               |
| read_name          | string      | null: false               |
| birth_date         | date_select | null: false               |

### Association
has_many :items
has_many :purchase_record


## items テーブル

| Column                  | Type                    | Options                        |
| ----------------------- | ----------------------- | ------------------------------ |
| item_name               | string                  | null: false                    |
| item_explanation        | text                    | null: false                    |
| category                | category_id             | null: false                    |
| condition               | condition_id            | null: false                    |
| delivery_charge_load    | delivery_charge_load_id | null: false                    |
| prefectures             | prefecture_id           | null: false                    |
| number_of_days          | number_of_day_id        | null: false                    |
| price                   | integer                 | null: false                    |
| user_id                 | references              | null: false, foreign_key: true |

### ActiveHash
| category_id             | integer | null: false |
| condition_id            | integer | null: false |
| delivery_charge_load_id | integer | null: false |
| prefecture_id           | integer | null: false |
| number_of_day_id        | integer | null: false |

### Association
belongs_to :users
has_one :purchase_record


## addresses テーブル

| Column        | Type                    | Options                        |
| ------------- | ----------------------- | ------------------------------ |
| post_code     | string                  | null: false                    |
| prefecture    | text                    | null: false                    |
| city          | category_id             | null: false                    |
| street_adress | condition_id            | null: false                    |
| bulding_name  | delivery_charge_load_id | null: false                    |
| phone_number  | prefecture_id           | null: false                    |

### ActiveHash
| prefecture_id | integer | null: false |

### Association
has_one :purchase_record


## purchase_record テーブル
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :items
belongs_to :addresses
