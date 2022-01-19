# アプリケーション名
Outputer A
# アプリケーションの概要 
自身の学習をアウトプットし、フィードバックを得てより良い学習に繋げる。
# URL
https://out-puter-a.herokuapp.com/
# テスト用アカウント
email: gest@gmail.com
password: 123456
# 利用方法
1.トップページからユーザー新規登録を行う。  
2.投稿ボタンから投稿するタイプを選択し、内容を投稿する。  
3.一覧ページなどより投稿を見て、コメントを行う。  
4.コメントに回答を行う。  


# アプリケーションを作成した背景 
学習においてアウトプットが非常に重要であると考えており、そのような場を設けるということを思いついた。フィードバックを得ることでさらなる学習にも繋がり、フィードバックを行うことで学習に繋がるため、より良い学習環境の一つのパーツとしてこのアプリケーションを開発する。
# 洗い出した用件
 https://docs.google.com/spreadsheets/d/1F229CpK8vNGGYh7pWm2QpF4gtitouMslGx8KKhv7smg/edit#gid=982722306 
# 実装した機能についての画像やGIF、その説明
## トップページ
[![Image from Gyazo](https://i.gyazo.com/6cfb282f56f55cccd02a914ea1083e37.png)](https://gyazo.com/6cfb282f56f55cccd02a914ea1083e37)
トップページです。こちらでは新規で投稿されたノート、プレゼンがピックアップされるようになっています。また、検索、日記をつけることもできるようになっています。
ユーザーネームをクリックすることによりマイページへと遷移できます。
## マイページ
[![Image from Gyazo](https://i.gyazo.com/5c8365afad0c634e03e7f490ca901e53.png)](https://gyazo.com/5c8365afad0c634e03e7f490ca901e53)
マイページです。この画像では勉強時間のページになっています。このページでは日記を元に勉強時間を表示するようにしています。また、自身の勉強するカテゴリーを登録できるようになっており、登録されたカテゴリー毎の勉強時間の表示に変えることができるようになっています。その他、自身の投稿一覧、コメント一覧、フォロー一覧を確認できるようになっています。
# 実装予定の機能
チーム作成機能、いいね機能などを考えている
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/59352962d4955851c2fbfc18fd962a31.png)](https://gyazo.com/59352962d4955851c2fbfc18fd962a31)
# 画像遷移図
[![Image from Gyazo](https://i.gyazo.com/b3a2ba97ecf37269c5edf9a1c743358d.png)](https://gyazo.com/b3a2ba97ecf37269c5edf9a1c743358d)
# 開発環境
・フロントエンド : HTML,CSS  
・バックエンド : Ruby(ver.6.0.0) / Ruby on Rails(ver)  
・インフラ : AWS (EC2/S3)  
・テスト : RSpec  
・テキストエディタ : Visual Studio Code  
・タスク管理 : GitHubプロジェクトボード  

# ローカルでの動作方法
以下のコマンドを順に実行してください
% git clone https://github.com/outputera
% cd outputera
% bundle install
% yarn install
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

- has_many :opinions
- has_many :followers

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
| date        | date    | null: false                       |
| time        | integer | null: false                       |
| category_id | integer | null: false                       |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## notes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
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
| text        | text       | null: false                    |
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
| detail_id   | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :contents
- has_many :presentation_comments
- has_many :presentation_answers

## contents テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| page         | integer    | null: false                    |
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

## presentation_answers テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     | null: false                    |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| presentation | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :presentation


## 追加機能

## opinion テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| content      | text       | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## follower テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| follow_id    | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

-belongs_to :user