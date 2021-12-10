# テーブル設計

## users テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| email              | string     | null: false       |
| encrypted_password | string     | null: false       |
| user_category      | references | foreign_key: true |

### Association

- has_many :user_categories
- has_many :categories, through: :user_categories
- has_many :diaries
- has_many :notes
- has_many :note_comments
- has_many :note_answers
- has_many :presentations
- has_many :presentation_comments
- has_many :presentation_answers

## categories テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| category_id   | integer    |                   |
| user_category | references | foreign_key: true |

### Association

- has_many :user_categories
- has_many :users, through: :user_categories

## user_categories テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| category | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :category


## diaries テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| time        | integer | null: false |
| category_id | integer | null: false |

### Association

- belongs_to :user

## notes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     |                                |
| text        | text       | null: false                    |
| category_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :note_comments
- has_many :note_answers

## note_comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| comment     | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| note        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :note

## note_answers テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | string     | null: false                    |
| text        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| note        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :note

## presentations テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| category_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :presentation_contents
- has_many :presentation_comments
- has_many :presentation_answers

## presentation_contents テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     | null: false                    |
| text         | text       | null: false                    |
| presentation | references | null: false, foreign_key: true |

### Association

- belongs_to :presentation

## presentation_comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment      | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| presentation | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :presentation

## presentation_comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     | null: false                    |
| text         | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| presentation | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :presentation