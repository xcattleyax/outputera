| 記述すること         | 備考                                                |
| ------------------ | -------------------------------------------------- |
| アプリケーション名    | Outputer A                                         |
| アプリケーションの概要 | 自身の学習をアウトプットし、フィードバックを得てより良い学習に繋げる。 |
| URL                |                                                    |
| テスト用アカウント    |                                                    |
| 利用方法            | <dl> <dt>1.トップページからユーザー新規登録を行う。</dt> <dt>2.投稿ボタンから投稿するタイプを選択し、内容を投稿する。</dt> <dt>3.一覧ページなどより投稿を見て、コメントを行う。</dt> <dt>4.コメントに回答を行う。</dt></dl> |
| アプリケーションを作成した背景 | 学習においてアウトプットが非常に重要であると考えており、そのような場を設けるということを思いついた。フィードバックを得ることでさらなる学習にも繋がり、フィードバックを行うことで学習に繋がるため、より良い学習環境の一つのパーツとしてこのアプリケーションを開発する。  |
| 洗い出した用件       | https://docs.google.com/spreadsheets/d/1F229CpK8vNGGYh7pWm2QpF4gtitouMslGx8KKhv7smg/edit#gid=982722306  |
| 実装した機能についての画像やGIF、その説明 |                                                   |
| 実装予定の機能       | 検索機能の作成、友達登録、チーム作成機能などを考えている     |
| データベース設計      | [![Image from Gyazo](https://i.gyazo.com/7dbd6a4c62d018a85f6acc968cbee2ce.png)](https://gyazo.com/7dbd6a4c62d018a85f6acc968cbee2ce)  |
| 画像遷移図           | [![Image from Gyazo](https://i.gyazo.com/b3a2ba97ecf37269c5edf9a1c743358d.png)](https://gyazo.com/b3a2ba97ecf37269c5edf9a1c743358d)   |
| 開発環境             | <dl><dt> ・フロントエンド : HTML,CSS / JavaScript </dt><dt> ・バックエンド : Ruby(ver.) / Ruby on Rails(ver) </dt><dt> ・インフラ : AWS (EC2/S3) </dt><dt> ・テスト : RSpec </dt><dt> ・テキストエディタ : Visual Studio Code </dt><dt> ・タスク管理 : GitHubプロジェクトボード </dt></dl> |
| ローカルでの動作方法  |                                                    |

# テーブル設計

## users テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| email              | string     | null: false       |
| encrypted_password | string     | null: false       |

### Association

- has_many :trends
- has_many :diaries
- has_many :notes
- has_many :note_comments
- has_many :note_answers
- has_many :presentations
- has_many :presentation_comments
- has_many :presentation_answers

## trends テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| category_id   | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## diaries テーブル

| Column      | Type    | Options                           |
| ----------- | ------- | --------------------------------- |
| data        | data    | null: false                       |
| time        | integer | null: false                       |
| category_id | integer | null: false                       |
| user        | references | null: false, foreign_key: true |

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