| 記述すること         | 備考                                                |
| ------------------ | -------------------------------------------------- |
| アプリケーション名    | Outputer A                                         |
| アプリケーションの概要 | 自身の学習をアウトプットし、フィードバックを得てより良い学習に繋げる。 |
| URL                |                                                    |
| テスト用アカウント    |                                                    |
| 利用方法            | <dl> <dt>1.トップページからユーザー新規登録を行う。</dt> <dt>2.投稿ボタンから投稿するタイプを選択し、内容を投稿する。</dt> <dt>3.一覧ページなどより投稿を見て、コメントを行う。</dt> <dt>4.コメントに回答を行う。</dt></dl> |
| アプリケーションを作成した背景 | 学習においてアウトプットが非常に重要であると考えており、そのような場を設けるということを思いついた。フィードバックを得ることでさらなる学習にも繋がり、フィードバックを行うことで学習に繋がるため、より良い学習環境の一つのパーツとしてこのアプリケーションを開発する。  |
| 洗い出した用件       |                                                    |
| 実装した機能についての |                                                   |
| 画像やGIF、その説明   |                                                   |
| 実装予定の機能       |                                                    |
| データベース設計      | [![Image from Gyazo](https://i.gyazo.com/c7eb28224fc3045d9197ce710004258d.png)](https://gyazo.com/c7eb28224fc3045d9197ce710004258d) |
| 画像遷移図           |                                                   |
| 開発環境             | <dl><dt> ・フロントエンド : HTML,CSS / JavaScript </dt><dt> ・バックエンド : Ruby(ver.) / Ruby on Rails(ver) </dt><dt> ・インフラ : AWS (EC2/S3) </dt><dt> ・テスト : RSpec </dt><dt> ・テキストエディタ : Visual Studio Code </dt><dt> ・タスク管理 : GitHubプロジェクトボード </dt></dl> |
| ローカルでの動作方法  |                                                    |

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