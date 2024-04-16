# テーブル設計

## usersテーブル
| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| nickname        | string     | null: false                    |
| email           | string     | null: false, unique: true      |
| password        | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |

### Association
- has_many :items,deliveries,comments


## itemsテーブル
| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| product         | string     | null: false                    |
| price           | string     | null: false                    |
| seller_comment  | text       |                                |
| seller          | string     | null: false                    |
| category        | stirig     | null: false                    |
| condition       | text       | null: false                    |
| postage_type    | string     | null: false                    |
| shopping_region | string     | null: false                    |
| shopping_date   | string     | null: false                    |
| user            | references | null: false, foreign_key: ture |

### Association
- belongs_to :user
- has_one :delivery
- has_many :comments


## deliveriesテーブル
| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| post_code       | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| street_address  | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| user            | references | null: false, foreign_key: ture |
| item            | references | null: false, foreign_key: ture |

### Association
- belongs_to :user, item


## commentsテーブル
| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| content         | text       | null: false                    |
| user            | references | null: false, foreign_key: ture |
| item            | references | null: false, foreign_key: ture |

### Association
- belongs_to :user, item