# テーブル設計

## users テーブル

| Column           | Type    | Options       |
| ---------        | ------  | -----------   |
| nickname         | string  | null  : false |
| email            | string  | unique: true  |
| name_kanji       | string  | null  : false |
| name_kana        | string  | null  : false |
| birthday_year    | integer | null  : false |
| birthday_month   | integer | null  : false |
| birthday_date    | integer | null  : false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options     |
| --------------| ------     | ----------- |
| name          | string     | null: false |
| price         | integer    | null: false |
| seller        | string     | null: false |
| description   | text       | null: false |
| category      | integer    | null: false |
| shipping_rate | integer    | null: false |
| shipping_area | integer    | null: false |
| shipping_days | integer    | null: false |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user 

## orders テーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| content             | string     | null: false |
| amounts             | integer    | null: false |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| postal_code      | integer    | null: false |
| prefecture       | string     | null: false |
| city             | string     | null: false |
| house_number     | string     | null: false |
| building_nama    | string     | null: false |
| telephone_number | integer    | null: false |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order