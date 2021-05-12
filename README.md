# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------  | ------  | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| name_kanji | text    | null: false |
| name_kana  | text    | null: false |
| birthday   | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options     |
| --------------| ------     | ----------- |
| name          | string     | null: false |
| price         | integer    | null: false |
| image         | 
| seller        | string     | null: false |
| description   | text       | null: false |
| category      | string     | null: false |
| shipping_rate | integer    | null: false |
| shipping_area | string     | null: false |
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
| card_number         | integer    | null: false |
| card_expiration     | integer    | null: false |
| card_security_cord  | integer    | null: false |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| post_code        | integer    |                                |
| prefectures      | string     |                                |
| municipalities   | string     |                                |
| block            | string     |                                |
| building         | string     |                                |
| telephone_number | integer    |                                |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :orders